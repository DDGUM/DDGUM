<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaSanPham.aspx.cs" Inherits="Group12.Admin.SuaSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- partial -->
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">Sửa sản phẩm </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sửa</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <form class="forms-sample">
                            <p>
                                <label for="exampleInputName1">ID sản phẩm: </label>
                                <asp:Label ID="txtId" runat="server" />
                            </p>
                            <div class="form-group">
                                <label for="exampleInputName1">Tên sản phẩm</label>
                                <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rtensp" ControlToValidate="txtName"
                                    ErrorMessage="Bạn phải điền tên sản phẩm" ForeColor="Red" runat="server" ValidationGroup="ProductGroup" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputSKU">SKU</label>
                                <asp:TextBox ID="TxtSKU" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rSKU" ControlToValidate="txtSKU"
                                    ErrorMessage="Bạn phải điền SKU" ForeColor="Red" runat="server" ValidationGroup="ProductGroup" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Danh mục</label>
                                <asp:DropDownList ID="cbbCategoryId" runat="server" Height="28px" Width="160px"></asp:DropDownList>
                            </div>
                            <div class="form-group d-flex align-items-center">
                                <label for="exampleInputCity1">Hình ảnh</label>
                                <asp:TextBox ID="TxtImage" runat="server"></asp:TextBox>
                                <label for="exampleInputName1" class="mx-4">Chọn hình ảnh mới</label>
                                <asp:FileUpload ID="fuAnh" CssClass="btn btn-gradient-primary btn-fw" class="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail3">Đơn giá</label>
                                <asp:TextBox ID="txtPrice" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rPrice" ControlToValidate="txtPrice"
                                    ErrorMessage="Bạn phải điền đơn giá" ForeColor="Red" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail3">Số lượng</label>
                                <asp:TextBox ID="TxtSoLuong" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rStock" ControlToValidate="txtSoLuong"
                                    ErrorMessage="Bạn phải điền số lượng sản phẩm" ForeColor="Red" runat="server" ValidationGroup="ProductGroup" />
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea1">Mô tả</label>
                                <asp:TextBox ID="txtgioithieu" class="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="the" runat="server"></asp:Label>
                            <asp:Button ID="btnSua" CssClass="btn btn-gradient-primary btn-fw" CommandName="sua" Text="Sửa" runat="server" OnClick="btnSua_Click1" ValidationGroup="ProductGroup" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/file-upload.js"></script>
</asp:Content>