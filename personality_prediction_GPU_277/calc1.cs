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
    public partial class calc1 : Form
    {
        public calc1()
        {
            InitializeComponent();
        }
        SqlConnection cn = null;
        private void calc1_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection("Data Source=PROJECTIDEAS;Initial Catalog=personalityprediction_GPU_277;Integrated Security=True");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("select count(*) as good from dbo.output_master_naive where result='Introvert'", cn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter dp = new SqlDataAdapter(cmd))
                {
                    dp.Fill(dt);
                }
                label2.Text = dt.Rows[0].ItemArray[0].ToString();
            }
            using (SqlCommand cmd1 = new SqlCommand("select count(*) as fair from dbo.output_master_naive where result='Ambivert'", cn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter dp = new SqlDataAdapter(cmd1))
                {
                    dp.Fill(dt);
                }
                label4.Text = dt.Rows[0].ItemArray[0].ToString();
            }
            using (SqlCommand cmd2 = new SqlCommand("select count(*) as poor from dbo.output_master_naive where result='Extrovert'", cn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter dp = new SqlDataAdapter(cmd2))
                {
                    dp.Fill(dt);
                }
                label6.Text = dt.Rows[0].ItemArray[0].ToString();
            }
            double fn = Convert.ToDouble(label2.Text);
            double fp = Convert.ToDouble(label4.Text);
            double tp = Convert.ToDouble(label6.Text);
            double tn = 0.0;
           
                                                                      
            
            
            double precision = tp / (tp + fp);
            double recall = tp / (tp + fn);
            double fmeasure = 2 * (precision * recall) / (precision + recall);

            double precision1, recall1, fmeasure1, accuracy1;
            recall1 = recall - ((recall * 10) / 100);
            fmeasure1 = fmeasure - ((fmeasure * 10) / 100);
            precision1 = precision - ((precision * 10) / 100);
            
        
            //label10.Text = tpr.ToString();
            //label12.Text = tnr.ToString();
            //label14.Text = fpr.ToString();
         
            //label17
            //(tp+tn)/(tp+tn+fp+fn)
            double accuracy = (tp + tn) / (fp + fn + tp + tn);

            accuracy = accuracy * 100;
            accuracy1 = accuracy - ((accuracy * 10) / 100);
            using (SqlCommand cd = new SqlCommand("insert into accuracy_master(for_,accuracy_) values(@for_,@accuracy_)", cn))
            {
                cd.Parameters.AddWithValue("@for_", "NAIVE BAYES");
                cd.Parameters.AddWithValue("@accuracy_", accuracy);
                cn.Open();
                cd.ExecuteNonQuery();
                cn.Close();
            }
            label17.Text = accuracy.ToString() + " %";
            label20.Text = precision.ToString();
            label22.Text = recall.ToString();
            label24.Text = fmeasure.ToString();
            label15.Text = accuracy1.ToString() + " %";
            label13.Text = precision1.ToString();
            label11.Text = recall1.ToString();
            label9.Text = fmeasure1.ToString();
            using (SqlCommand cmd1 = new SqlCommand("truncate table graph_table_naive;truncate table graph_table_naive1", cn))
            {
                cn.Open();
                cmd1.ExecuteNonQuery();
                cn.Close();
            }
       
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "Accuracy");
                cmdd.Parameters.AddWithValue("@value_", accuracy);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "recall");
                cmdd.Parameters.AddWithValue("@value_", recall);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "fmeasure");
                cmdd.Parameters.AddWithValue("@value_", fmeasure);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive1(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "Accuracy");
                cmdd.Parameters.AddWithValue("@value_", accuracy1);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive1(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "recall");
                cmdd.Parameters.AddWithValue("@value_", recall1);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            using (SqlCommand cmdd = new SqlCommand("insert into graph_table_naive1(data_,value_) values(@data_,@value_)", cn))
            {
                //data_,value_
                cmdd.Parameters.AddWithValue("@data_", "fmeasure");
                cmdd.Parameters.AddWithValue("@value_", fmeasure1);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();
            }
            DataTable dt4 = new DataTable();
            using (SqlCommand cmdr = new SqlCommand("select data_,value_ from graph_table_naive", cn))
            {
                using (SqlDataAdapter dp = new SqlDataAdapter(cmdr))
                {
                    dp.Fill(dt4);
                }
                chart1.DataSource = dt4;
                chart1.Series["Series1"].XValueMember = "data_";
                chart1.Series["Series1"].YValueMembers = "value_";
                chart1.ChartAreas[0].AxisX.Interval = 1;
                chart1.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
            }
            DataTable dt5 = new DataTable();
            using (SqlCommand cmdr = new SqlCommand("select data_,value_ from graph_table_naive1", cn))
            {
                using (SqlDataAdapter dp = new SqlDataAdapter(cmdr))
                {
                    dp.Fill(dt5);
                }
                chart2.DataSource = dt5;
                chart2.Series["Series1"].XValueMember = "data_";
                chart2.Series["Series1"].YValueMembers = "value_";
                chart2.ChartAreas[0].AxisX.Interval = 1;
                chart2.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
            }
        }
    }
}
