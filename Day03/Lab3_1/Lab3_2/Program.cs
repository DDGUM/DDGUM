namespace Lab3_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //tạo đối tượng contact với constructor không tham số
            Contact ct1 = new Contact();
            //gán giá trị cho ct1
            ct1.Id = 6;
            ct1.Firstname = "Nguyen Tuan";
            ct1.Lastname = "Tai";
            ct1.Address = "Ha Noi";
            ct1.Phone = "0364995238";
            ct1.Email = "nguyentuantai@gmail.com";
            //tạo đối tượng contact với constructor có tham số
            Contact ct2 = new Contact(5, "Nguyen Tuan", "Khanh", "Tuyen Quang", "0375886994", "bupbetinh@gmail.com");
            //hiển thị thông tin ct1 và ct2
            ct1.Display();
            ct2.Display();
        }
    }
}
