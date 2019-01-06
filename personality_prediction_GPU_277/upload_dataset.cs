using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace personality_prediction_GPU_277
{
    public partial class upload_dataset : Form
    {
        string path;
        public upload_dataset()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog opd = new OpenFileDialog();
                opd.Filter = "Excelfiles|*.xlsx";
                DialogResult dr = opd.ShowDialog();
                label2.Text = opd.FileName;
                path = label2.Text;
                button2.Visible = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("SELECT EXCEL FILE!!", "ERROR");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Dbconnection db = new Dbconnection();
            db.Connection();
            using (SqlCommand cmdf = new SqlCommand("truncate table dataset", db.con))
            {
                db.con.Open();
                cmdf.ExecuteNonQuery();
                db.con.Close();
            }
            progressBar1.Visible = true;
            progressBar1.ForeColor = Color.Red;
            string pathconn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + path + "';Extended Properties=\"Excel 12.0 Xml;HDR=NO;IMEX=1;\"";
            OleDbConnection conn = new OleDbConnection(pathconn);
            conn.Open();
            OleDbDataAdapter dataadp = new OleDbDataAdapter("select * from [Sheet1$]", conn);
            DataTable ds = new DataTable();
            conn.Close();
            dataadp.Fill(ds);
           
            dataGridView1.DataSource = ds;
            progressBar1.Minimum = 0;
            progressBar1.Maximum = dataGridView1.Rows.Count - 1;
            SqlBulkCopy objbulk = new SqlBulkCopy(db.con);
            //assigning Destination table name    
            objbulk.DestinationTableName = "dataset";
            //Mapping Table column    
            objbulk.ColumnMappings.Add("f2","Test1");
            objbulk.ColumnMappings.Add("f3","Test2");
            objbulk.ColumnMappings.Add("f4","Test3");
            objbulk.ColumnMappings.Add("f5","Test4");
            objbulk.ColumnMappings.Add("f6", "result");
            //inserting Datatable Records to DataBase    
            db.con.Open();
            objbulk.WriteToServer(ds);
            db.con.Close();
        }
    }
}
