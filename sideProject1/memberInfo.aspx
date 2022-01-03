<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["userInfo"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Member m = Session["userInfo"] as Member;
                Label1.Text = m.Name.Substring(1, 2);

                List<cart> cList = Session["cart"] as List<cart>;
                Repeater1.DataSource = cList;
                Repeater1.DataBind();
            }

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
        <h2 class="ltext-105 cl0 txt-center">訓練家 您好！
		</h2>
    </section>


    <!-- Content page -->
    <section class="bg0 p-t-62 p-b-60">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-9 p-b-80">
                    <div class="p-r-45 p-r-0-lg">
                        <!-- item blog -->
                        <div class="p-b-63">
                            <a class="hov-img0 how-pos5-parent">
                                <img src="images/blog-04.jpg" alt="IMG-BLOG">
                            </a>
                            <div class="flex-col-c-m size-123 bg9 how-pos5">
                                <%--<span class="ltext-107 cl2 txt-center">22</span>
                                    <span class="stext-109 cl3 txt-center">Jan 2018</span>--%>
                                <asp:Label CssClass="ltext-107 cl2 txt-center" ID="Label1" runat="server" Text="Label"></asp:Label>
                                <asp:Label CssClass="stext-109 cl3 txt-center" ID="Label2" runat="server" Text="Label">歡迎登入</asp:Label>
                            </div>

                            <div class="p-t-32">
                                <h4 class="p-b-15">
                                    <a href="memberRevise.aspx" class="ltext-108 cl2 hov-cl1 trans-04">會員資料</a>
                                </h4>

                                <p class="stext-117 cl6">
                                    您可以在此檢視與修改您的個人資料，像是姓名、email、密碼...等。					
                                </p>
                                <hr />
                                <h4 class="p-b-15">
                                    <a href="cart.aspx" class="ltext-108 cl2 hov-cl1 trans-04">購物車</a>
                                </h4>

                                <p class="stext-117 cl6">
                                    您可以在此檢視您的購物車，並前往結帳。					
                                </p>
                                <hr />
                                <h4 class="p-b-15">
                                    <a href="memberDelete.aspx" class="ltext-108 cl2 hov-cl1 trans-04">刪除會員</a>
                                </h4>

                                <p class="stext-117 cl6">
                                    我們由衷希望您不會點進此選項。					
                                </p>
                                <hr />

                                <div class="flex-w flex-sb-m p-t-18">
                                    <a href="/logout.aspx" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">會員登出
                                    <i class="fa fa-long-arrow-right m-l-9"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <div class="col-md-4 col-lg-3 p-b-80">
                            <div class="side-menu">
                                <div class="p-t-65">
                                    <h4 class="mtext-112 cl2 p-b-33">Θ 購物車裡的神奇寶貝
							</h4>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <ul>
                            <li class="flex-w flex-t p-b-30">
                                <a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
                                    <img class="size-213" src='<%# Eval("ImageFileName","/images/Products/{0}") %>' alt="PRODUCT">
                                </a>

                                <div class="size-215 flex-col-t p-t-8">
                                    <a href="#" class="stext-116 cl8 hov-cl1 trans-04"><%# Eval("ProductName") %>
										</a>

                                    <span class="stext-116 cl6 p-t-20">
										</span>
                                </div>
                            </li>

                        </ul>
                    </ItemTemplate>
                    <FooterTemplate>
                                </div>
                            </div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>

