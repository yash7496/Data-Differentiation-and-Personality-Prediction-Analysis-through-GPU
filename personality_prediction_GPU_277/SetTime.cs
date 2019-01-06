using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace personality_prediction_GPU_277
{
    public class SetTime
    {
        public SetTime()
        {
        }
        static double _time;
        static string filepath;
        public static double Time
        {
            get
            {
                return _time;
            }
            set
            {
                _time = value;
            }
        }
        public static string FilePath
        {
            get
            {
                return filepath;
            }
            set
            {
                filepath = value;
            }
        }

    }
}
