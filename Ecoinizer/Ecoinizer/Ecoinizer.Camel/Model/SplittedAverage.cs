using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ecoinizer.Camel.Model
{
    public class SplittedAverage
    {
        public double Sum { get; set; }
        public int Count { get; set; }

        public double Average { get { return Math.Round(Sum / Count, 2) ;} }

        public SplittedAverage()
        {
            Sum = 0;
            Count = 0;
        }
    }
}
