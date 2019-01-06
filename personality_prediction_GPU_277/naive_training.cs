using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ProbabilityFunctions;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

namespace personality_prediction_GPU_277
{
    public partial class naive_training : Form
    {
        public naive_training()
        {
            InitializeComponent();
        }
        SqlConnection cn = new SqlConnection("Data Source=LENOVO-PC\\SQLEXPRESS;Initial Catalog=personalityprediction_GPU_277;Integrated Security=True");
        private void naive_training_Load(object sender, EventArgs e)
        {

            //Classifier classifier = new Classifier();
            //classifier.TrainClassifier(table);
            //string val = classifier.Classify(new double[] { Id_, Age_, Workclass_, Education_, MaritalStatus_, Occupation_, Sex_, NativeCountry_, Class_ });
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if ((textBox1.Text.Length>0) && (textBox2.Text.Length>0) && (textBox3.Text.Length>0) && (textBox4.Text.Length>0))
            {
                double t1, t2, t3, t4;
                using (SqlCommand cmd = new SqlCommand("truncate table temp_z", cn))
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
                t1 = Convert.ToDouble(textBox1.Text);
                t2 = Convert.ToDouble(textBox2.Text);
                t3 = Convert.ToDouble(textBox3.Text);
                t4 = Convert.ToDouble(textBox4.Text);
                DataTable table = new DataTable();
                using (SqlCommand cmd = new SqlCommand("select *  from dataset", cn))
                {
                    using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                    {
                        adp.Fill(table);
                    }
                }
                Classifier classifier = new Classifier();
                classifier.TrainClassifier(table);
                string val = classifier.Classify(new double[] { t1,t2,t3,t4 });
                if (val == "Good")
                {
                    label2.Text = "Good";
                }
                else if (val == "Fair")
                {
                    label2.Text = "Fair";
                }
                else  if(val == "Poor")
                {
                    label2.Text = "Poor";
                }
            }
            else
            {
                MessageBox.Show("ENTER values!");
            }
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
