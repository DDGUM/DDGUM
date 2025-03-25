using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group12.Class;
namespace Group12.Admin
{
    public partial class SuaUsers : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User d = (User)Session["us"];
                txtId.Text = d.Id.ToString();
                txtFirst.Text = d.FirstName ?? string.Empty;
                txtLast.Text = d.LastName ?? string.Empty;
                txtEmail.Text = d.Email;
                txtUsername.Text = d.Username;
                txtPassword.Text = d.Password;
                txtPhone.Text = d.Phone ?? string.Empty;
                txtAddress.Text = d.Address ?? string.Empty;
                Byte role = (byte)d.Permission;
                if (role == 1)
                {

                    ddlPermission.SelectedValue = "1";
                }
                else if (role == 0)
                {
                    ddlPermission.SelectedValue = "0";

                }
                txtId.Enabled = false;
                DataBind();
            }
        }

        protected void btnSua_Click1(object sender, EventArgs e)
        {
            User d = (User)Session["us"];
            int currentId = d.Id;
            User currentUser = data.GetUserById(currentId); 
            try
            {
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    the.Text = "Email, tên đăng nhập và mật khẩu không được để trống!";
                    return;
                }
                User x = new User();
                x.Id = int.Parse(txtId.Text);
                x.FirstName = !string.IsNullOrEmpty(txtFirst.Text) ? txtFirst.Text : null;
                x.LastName = !string.IsNullOrEmpty(txtLast.Text) ? txtLast.Text : null;
                x.Email = txtEmail.Text;
                x.Username = txtUsername.Text;
                x.Password = (txtPassword.Text == currentUser.Password) ? currentUser.Password : data.ComputeMd5Hash(txtPassword.Text.Trim());
                x.Phone = !string.IsNullOrEmpty(txtPhone.Text) ? txtPhone.Text : null;
                x.Address = !string.IsNullOrEmpty(txtAddress.Text) ? txtAddress.Text : null;
                string role = ddlPermission.SelectedValue;
                if (role == "1")
                {
                    x.Permission = Convert.ToByte(1);
                }
                else if (role == "0")
                {
                    x.Permission = Convert.ToByte(0);
                }
                data.UpdateUser(x);
                Response.Redirect(url: "QuanLyUsers.aspx");
            }
            catch (Exception e1)
            {
                the.Text = "Có lỗi xảy ra: " + e1.Message.ToString();
            }
        }
    }
}