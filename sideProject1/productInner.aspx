<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["userInfo"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Member m = Session["userInfo"] as Member;
                if (m.Account == "ted")
                {
                    List<Product> products = ProductUtility.getProducts();
                    Repeater1.DataSource = products;
                    Repeater1.DataBind();
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/productAdd.aspx");
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.getProducts();
        List<Product> electricity = products.Where(s => s.Property == "電").ToList();
        Repeater1.DataSource = electricity;
        Repeater1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.getProducts();
        List<Product> water = products.Where(s => s.Property == "水").ToList();
        Repeater1.DataSource = water;
        Repeater1.DataBind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.getProducts();
        List<Product> fire = products.Where(s => s.Property == "火").ToList();
        Repeater1.DataSource = fire;
        Repeater1.DataBind();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.getProducts();
        List<Product> ice = products.Where(s => s.Property == "冰").ToList();
        Repeater1.DataSource = ice;
        Repeater1.DataBind();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.getProducts();
        List<Product> grass = products.Where(s => s.Property == "草").ToList();
        Repeater1.DataSource = grass;
        Repeater1.DataBind();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/productInner.aspx");
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string str = TextBox1.Text;
        List<Product> products = ProductUtility.getProducts();
        List<Product> products2 = products.Where(s=>s.ProductName.Contains(str)).ToList();
        Repeater1.DataSource = products2;
        Repeater1.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">神奇寶貝設定
		</h2>
    </section>
    <!-- Product -->
    <div class="bg0 m-t-23 p-b-140">
        <div class="container">
            <div class="flex-w flex-sb-m p-b-52">
                <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                    <asp:Button ID="Button7" runat="server" Text="All Pokemon" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button7_Click" />

                    <asp:Button ID="Button2" runat="server" Text="Electricity" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button2_Click" />

                    <asp:Button ID="Button3" runat="server" Text="Water" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button3_Click" />

                    <asp:Button ID="Button4" runat="server" Text="Fire" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button4_Click" />

                    <asp:Button ID="Button5" runat="server" Text="Ice" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button5_Click" />

                    <asp:Button ID="Button6" runat="server" Text="Grass" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button6_Click" />

                </div>

                <div class="flex-w flex-c-m m-tb-10">
                    <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                        <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                        <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                        Search
                    </div>
                </div>

                <!-- Search product -->
                <div class="dis-none panel-search w-full p-t-10 p-b-15">
                    <div class="bor8 dis-flex p-l-15">
                        <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="mtext-107 cl2 size-114 plh2 p-r-15" placeholder="Search" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <%--<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">--%>
                    </div>
                </div>

                <!-- Filter -->
                <div class="dis-none panel-filter w-full p-t-10">
                    <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                        <div class="filter-col1 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Sort By
						
                            </div>

                            <ul>
                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">Default
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">Popularity
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">Average rating
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active">Newness
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">Price: Low to High
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">Price: High to Low
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter-col2 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Price
						
                            </div>

                            <ul>
                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active">All
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">$0.00 - $50.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">$50.00 - $100.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">$100.00 - $150.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">$150.00 - $200.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="#" class="filter-link stext-106 trans-04">$200.00+
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter-col3 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Color
						
                            </div>

                            <ul>
                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #222;">
                                        <i class="zmdi zmdi-circle"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04">Black
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
                                        <i class="zmdi zmdi-circle"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active">Blue
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
                                        <i class="zmdi zmdi-circle"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04">Grey
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
                                        <i class="zmdi zmdi-circle"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04">Green
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
                                        <i class="zmdi zmdi-circle"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04">Red
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
                                        <i class="zmdi zmdi-circle-o"></i>
                                    </span>

                                    <a href="#" class="filter-link stext-106 trans-04">White
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter-col4 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Tags
						
                            </div>

                            <div class="flex-w p-t-4 m-r--5">
                                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Fashion
                                </a>

                                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Lifestyle
                                </a>

                                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Denim
                                </a>

                                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Streetstyle
                                </a>

                                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Crafts
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <div class="row isotope-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="<%# Eval("ImageFileName","/images/Products/{0}")%>" alt="">
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04" NavigateUrl='<%# Eval("id","/ProductEdit.aspx?id={0}") %>'>Edit</asp:HyperLink>
                                <%--<a href="<%# Eval("id","/ProductEdit.aspx?id={0}") %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 ">Edit
							</a>--%>
                            </div>
                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <!-- product name -->
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><%# Eval("ProductName")%></a>
                                    <!-- product price -->
                                    <span class="stext-105 cl3">$<%# Eval("Price")%></span>
                                </div>
                                <!-- love icon -->
                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>


            <!-- Load more -->
            <div class="flex-c-m flex-w w-full p-t-45">
                <%--<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">Load More</a>--%>
                <asp:Button ID="Button1" runat="server" Text="Add More" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" OnClick="Button1_Click" />

            </div>
        </div>
    </div>
</asp:Content>

