using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab3_3
{
    internal class Student
    {
        //tạo các thuộc tính dự phòng
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        //phương thức hiển thị
        public void Display()
        {
            Console.WriteLine("Id:" + Id);
            Console.WriteLine("Name:" + Name);
            Console.WriteLine("Age:" + Age);
        }
    }
}
