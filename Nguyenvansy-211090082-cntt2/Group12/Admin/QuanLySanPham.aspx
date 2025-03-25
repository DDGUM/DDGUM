<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs" Inherits="Group12.Admin.QuanLySanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">Quản lý sản phẩm</h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
                    <li class="breadcrumb-item active">Quản lý</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <asp:Button ID="btThem" CssClass="btn btn-gradient-primary btn-fw " PostBackUrl="~/Admin/ThemSanPham.aspx" runat="server" Text="Thêm sản phẩm" /><br />
                            <div class="header-search d-flex align-items-center">
                                <asp:TextBox ID="Txttimkiem" CssClass="border" Height="44px" runat="server"></asp:TextBox>
                                <asp:Button ID="Btn_Timkiem" OnClick="btnTim_Click" CssClass="btn btn-gradient-primary btn-fw" runat="server" Text="Tìm kiếm" />
                            </div>
                        </div>
                        <asp:GridView ID="GridView1" runat="server"
                            AllowPaging="True" PageSize="5"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" />
                                <asp:BoundField DataField="SKU" HeaderText="SKU" />
                                <asp:BoundField DataField="CategoryId" HeaderText="DM" />
                                <asp:BoundField DataField="Name" HeaderText="Tên" />
                                <asp:TemplateField HeaderText="Giá">
                                    <ItemTemplate>
                                        <%# Group12.Class.Extension.FormatCurrency(Convert.ToInt32(Eval("Price"))) %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Stock" HeaderText="SL" />

                                <%--<asp:BoundField DataField="Image" HeaderText="Image" />--%>
                                <asp:TemplateField HeaderText="Ảnh">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="anhhh" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image Width="96px" Height="96px" ID="Image1" runat="server" ImageUrl='<%# "~/Image/ProductImage/" + Eval("Image") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Xoá">
                                    <ItemTemplate>
                                        <asp:Button ID="buXoa" CommandName="xoa" CommandArgument='<%# Bind("Id") %>' Text="Xoá"
                                            OnCommand="Xoa_click" CssClass="btn btn-gradient-primary btn-sm" runat="server" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sửa">
                                    <ItemTemplate>
                                        <asp:Button ID="btnSua" CommandName="sua" CssClass="btn btn-gradient-primary btn-sm"
                                            CommandArgument='<%# Bind("Id") %>' Text="Sửa"
                                            OnCommand="Sua_click" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
</asp:Content>
