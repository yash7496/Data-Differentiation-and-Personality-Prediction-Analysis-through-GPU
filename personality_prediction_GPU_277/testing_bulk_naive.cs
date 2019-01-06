using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using ProbabilityFunctions;
using System.Diagnostics;

namespace personality_prediction_GPU_277
{
    public partial class testing_bulk_naive : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=PROJECTIDEAS;Initial Catalog=personalityprediction_GPU_277;Integrated Security=True");
        public testing_bulk_naive()
        {
            InitializeComponent();
        }
        static string path = "";
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog opd = new OpenFileDialog();
                 opd.Filter = "Excelfiles|*.xlsx";
                DialogResult dr = opd.ShowDialog();
                label2.Text = opd.FileName;
                path = label2.Text;
                start_testing(label2.Text);
                //button2.Visible = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("SELECT EXCEL FILE!!", "ERROR");
            }
        }
        public void start_testing(string path)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            DataTable table = new DataTable();
            using (SqlCommand cmd = new SqlCommand("select * from dataset", cn))
            {
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(table);
                }
            }
            Classifier classifier = new Classifier();
            classifier.TrainClassifier(table);
            string pathconn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + path + "';Extended Properties=\"Excel 12.0 Xml;HDR=NO;IMEX=1;\"";
            OleDbConnection conn = new OleDbConnection(pathconn);
            OleDbDataAdapter dataadp = new OleDbDataAdapter("select * from [Sheet1$]", conn);
            DataTable ds = new DataTable();
            dataadp.Fill(ds);
          //  ds.Rows[0].Delete();

            int t1 = 0, t2 = 0, t3 = 0, t4 = 0;
            for (int i = 1; i < ds.Rows.Count; i++)
            {
                try
                {
                    
                   
                    using (SqlCommand cmd = new SqlCommand("truncate table temp_z", cn))
                    {
                        cn.Open();
                        cmd.ExecuteNonQuery();
                        cn.Close();
                    }
                    t1 = Convert.ToInt32(ds.Rows[i]["f2"]);
                    t2 = Convert.ToInt32(ds.Rows[i]["f3"]);
                    t3 = Convert.ToInt32(ds.Rows[i]["f4"]);
                    t4 = Convert.ToInt32(ds.Rows[i]["f5"]);
                    string val = classifier.Classify(new double[] { t1, t2, t3, t4 });
                    if (val == "Introvert")
                    {
                        label2.Text = "Introvert";
                    }
                    else if (val == "Ambivert")
                    {
                        label2.Text = "Ambivert";
                    }
                    else if (val == "Extrovert")
                    {
                        label2.Text = "Extrovert";
                    }

                    using (SqlCommand cmdd = new SqlCommand("insert into output_master_naive(test1, test2, test3,test4,result) values(@test1, @test2, @test3,@test4,@result)", cn))
                    {
                        cmdd.Parameters.AddWithValue("test1", t1);
                        cmdd.Parameters.AddWithValue("test2", t2);
                        cmdd.Parameters.AddWithValue("test3", t3);
                        cmdd.Parameters.AddWithValue("test4", t4);
                        cmdd.Parameters.AddWithValue("result", val);
                        cn.Open();
                        cmdd.ExecuteNonQuery();
                        cn.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("ERROR");
                }
            }
            MessageBox.Show("DONE EXECUTING");
            stopwatch.Stop();
            TimeSpan ts = stopwatch.Elapsed;

            string TotalTime = ts.Seconds.ToString();
            SetTime.Time = Convert.ToDouble(TotalTime);
           // SetTime.FilePath = OutPutPath;
            lblShow.Text = TotalTime;
            button2.Visible = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            calc1 c1 = new calc1();
            c1.Show();
        }

        private void testing_bulk_naive_Load(object sender, EventArgs e)
        {
            button2.Visible = false;
            cn = new SqlConnection("Data Source=PROJECTIDEAS;Initial Catalog=personalityprediction_GPU_277;Integrated Security=True");
            using (SqlCommand cmd = new SqlCommand("truncate table output_master_naive", cn))
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
    }
}
