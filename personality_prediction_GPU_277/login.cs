using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace personality_prediction_GPU_277
{
    public partial class login : Form
    {
        public login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dbconnection db = new Dbconnection();
            db.Connection();
            if (txt_UserName.Text == "" || txt_Password.Text == "")
            {
                MessageBox.Show("Please provide UserName and Password");
                return;
            }
            try
            {
                //Create SqlConnection

                SqlCommand cmd = new SqlCommand("Select * from admin_master  where username=@username and password=@password", db.con);
                cmd.Parameters.AddWithValue("@username", txt_UserName.Text);
                cmd.Parameters.AddWithValue("@password", txt_Password.Text);
                db.con.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapt.Fill(ds);
                db.con.Close();
                int count = ds.Tables[0].Rows.Count;

                //If count is equal to 1, than show frmMain form
                if (count == 1)
                {
                    string id = ds.Tables[0].Rows[0]["aid"].ToString();
                    MessageBox.Show("Login Successful!");
                    this.Hide();
                    MDIParent1 m = new MDIParent1();
                    m.Show();
                }
                else
                {
                    MessageBox.Show("Login Failed!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void login_Load(object sender, EventArgs e)
        {

        }
    }
}
