using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab3_1
{
    internal class car
    {
        //khai báo các trường với phạm vi public
        public string make;
        public string model;
        public string color;
        public int year;
        //định nghĩa phương thức start
        public void Start()
        {
            System.Console.WriteLine(model + "khoi dong");
        }
        //định nghĩa phương thức step
        public void Stop()
        {
            System.Console.WriteLine(model + "dung");
        }
    }
}
