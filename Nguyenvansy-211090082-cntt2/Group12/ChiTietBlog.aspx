<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ChiTietBlog.aspx.cs" Inherits="Group12.ChiTietBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Banner Section Start -->
    <div class="page-banner-section section bg-gray">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="page-banner text-center">
                        <h1>Chi tiết bài viết</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="index.html">Trang chủ</a></li>
                            <li>Chi tiết bài viết</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Banner Section End -->

    <!-- Blog Section Start -->
    <div class="blog-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-100 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
                    <!-- Single Sidebar Start  -->
                    <div class="common-sidebar-widget">
                        <h3 class="sidebar-title">Bài viết theo tháng</h3>
                        <ul class="sidebar-list">
                            <li><a href="#"><i class="fa fa-angle-right"></i>June 2024 <span class="count">(2)</span></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i>May 2024 <span class="count">(0)</span></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i>April 2024 <span class="count">(0)</span></a></li>
                        </ul>
                    </div>
                    <!-- Single Sidebar End  -->
                </div>
                <div class="col-lg-9 order-lg-2 order-1">
                    <div>
                        <!-- Single Blog Start -->

                        <asp:DataList ID="DataList1" runat="server" DataKeyField="id">
                            <ItemTemplate>
                                <div class="blog">
                                    <div class="blog-inner mb-20 border p-4 rounded">

                                        <h1 class="title text-center font-weight-bold mb-3">
                                            <asp:Label ID="tieuDeLabel" runat="server" Text='<%# Eval("title") %>' />
                                        </h1>

                                        <div class="mb-3">
                                            <i class="fa fa-calendar"></i>
                                            <asp:Label ID="ngayDangTinLabel" runat="server" Text='<%# Eval("date") %>' />
                                        </div>

                                        <div class="text-center mb-3">
                                            <asp:Image ID="Image1" CssClass="img-fluid rounded" runat="server" ImageUrl='<%# "~/Image/Blog/" + Eval("thumb") %>' />
                                        </div>

                                        <div class="content mt-3">
                                            <h5 class="mt-2 text-justify">
                                                <asp:Label ID="noiDungLabel" runat="server" Text='<%# Eval("content") %>' />
                                            </h5>
                                            <p class="font-italic text-right">
                                                <asp:Label ID="tacGiaLabel" runat="server" Text='<%# Eval("author") %>' />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <!-- Single Blog End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog Section End -->
</asp:Content>
