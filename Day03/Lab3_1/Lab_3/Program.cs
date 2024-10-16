namespace Lab3_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //tạo đối tượng 
            StudentModel action = new StudentModel();
            //gọi phương thức lấy tất cả sinh viên
            List<Student> listall = action.GetStudent();
            //hiển thị
            foreach (var item in listall)
            {
                item.Display();
            }
            //gọi phương thức lấy sinh viên theo id
            Student st = action.GetStudent(2);
            //hiển thị
            foreach (var item in listall) 
            {
                item.Display();
            }
        }
    }
}
