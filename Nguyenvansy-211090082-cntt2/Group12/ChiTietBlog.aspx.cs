using Group12.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group12
{
    public partial class ChiTietBlog : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                View();
            }
        }
        private void View()
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                Group12.Class.Blog blog = data.getBlogById(id);
                if (blog != null)
                {
                    List<Group12.Class.Blog> blogList = new List<Group12.Class.Blog> { blog };
                    DataList1.DataSource = blogList;
                    DataBind();
                }
            }
        }
    }
}