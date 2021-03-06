<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            Product p = new Product(
                0,
                TextBox1.Text,
                DropDownList1.SelectedValue,
                int.Parse(TextBox4.Text),
                TextBox3.Text,
                FileUpload1.FileName);

            ProductUtility.addProduct(p);


            string path = Server.MapPath($"/images/Products/{p.ImageFileName}");

            FileUpload1.SaveAs(path);
        }
        Response.Redirect("~/product.aspx");
        //string str = Server.MapPath(FileUpload1.FileName.ToString());
        //Response.Write(str);
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product-E.aspx?Property=電");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product-W.aspx?Property=水");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product-F.aspx?Property=火");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product-I.aspx?Property=冰");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product-G.aspx?Property=草");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/productEdit.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <!-- Product -->
    <div class="bg0 m-t-23 p-b-140">
        <div class="container">
            <div class="flex-w flex-sb-m p-b-52">
                <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                    <asp:Button ID="Button7" runat="server" Text="All Pokemon" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button7_Click"/>

                    <asp:Button ID="Button2" runat="server" Text="Electricity" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button2_Click"/>
                
                    <asp:Button ID="Button3" runat="server" Text="Water" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button3_Click"/>
             
                    <asp:Button ID="Button4" runat="server" Text="Fire" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button4_Click"/>
                   
                    <asp:Button ID="Button5" runat="server" Text="Ice" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button5_Click"/>
                  
                    <asp:Button ID="Button6" runat="server" Text="Grass" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" BackColor="Transparent" OnClick="Button6_Click"/>
                    
                </div>

                <div class="flex-w flex-c-m m-tb-10">
                    <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                        <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                        <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                        Filter
				
                    </div>

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

                        <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
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
            <!-- Body -->
            <section class="contact-section " >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h4 class="mtext-112 cl2 p-b-33 p-t-55">新增寶可夢</h4>
                    </div>
                    <div class="col-lg-8">
                        <div class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-   group">
                                        <%--<input class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name">--%>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control valid" placeholder="Enter Product Name"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <%--<input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email">--%>
                                        <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control valid" placeholder="Enter Product Property"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control valid">
                                            <asp:ListItem>屬性</asp:ListItem>
                                            <asp:ListItem>電</asp:ListItem>
                                            <asp:ListItem>火</asp:ListItem>
                                            <asp:ListItem>水</asp:ListItem>
                                            <asp:ListItem>草</asp:ListItem>
                                            <asp:ListItem>冰</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <%--<input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email">--%>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control valid" placeholder="Enter Product Price"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <%--<input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email">--%>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control valid" placeholder="Enter Product Description"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="col-12">
                                    <div class="form-group">
                                        <%--<input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject">--%>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <%--<asp:Button ID="Button2" runat="server" Text="瀏覽圖片" OnClick="Button2_Click" />--%>
                                    </div>
                                </div> <br />
                            </div>
                            <div class="form-group mt-3">
                                <%--<button type="submit" class="button button-contactForm boxed-btn">Send</button>--%>
                                            <asp:Button ID="Button1" runat="server" Text="Add" CssClass="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04"  OnClick="Button1_Click"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="block2-pic hov-img0">
                            <asp:Image ID="Image1" runat="server" />
                        </div>
<%--                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Buttonwood, California.</h3>
                                <p>Rosemead, CA 91770</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+1 253 565 2365</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>support@colorlib.com</h3>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </section>

            <!-- Load more -->
            <div class="flex-c-m flex-w w-full p-t-45">
                <asp:LinkButton ID="LinkButton1" runat="server" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
                <%--<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">Load More</a>--%>
            </div>
        </div>
    </div>
</asp:Content>

