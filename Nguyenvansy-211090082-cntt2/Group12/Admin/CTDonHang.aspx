<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="CTDonHang.aspx.cs" Inherits="Group12.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="card">
            <div class="card-body">
                <asp:Repeater ID="OrderRepeater" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="d-flex">
                                <img class="list-image-item" src='../Image/ProductImage/<%# Eval("ImageUrl") %>' alt="Image" />
                                <span class="font-weight-bold ml-2" style="max-width: 480px"><%# Eval("ProductName") %></span>
                            </td>
                            <td><%# Eval("ColorName") %></td>
                            <td><%# Eval("Price") %></td>
                            <td>
                                <asp:Label ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="quantity-input" />
                            </td>
                            <td><%# Group12.Class.Extension.FormatCurrency(Convert.ToInt32(Eval("Total")))%></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
    
                    </FooterTemplate>
                </asp:Repeater>
                <div>
                    <span>Tổng tiền: </span>
                    <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
