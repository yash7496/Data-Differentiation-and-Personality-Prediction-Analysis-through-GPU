
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace personality_prediction_GPU_277
{
    class Dbconnection
    {
        public SqlConnection con;

        public void Connection()
        {
            con = new SqlConnection("data source=LENOVO-PC\\SQLEXPRESS;Initial Catalog=personalityprediction_GPU_277;integrated security=true;");

        }
    }
}
