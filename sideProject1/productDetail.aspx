<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        //string imagefilename = HiddenField1.Value;
        //if (FileUpload1.HasFile)
        //{ 
        //    string path = Server.MapPath($"/images/Products/{FileUpload1.FileName}");
        //    FileUpload1.SaveAs(path);
        //    imagefilename = FileUpload1.FileName;
        //}
        //Product p = new Product(
        //    int.Parse(Label2.Text),
        //    TextBox1.Text,
        //    DropDownList1.SelectedValue,
        //    int.Parse(TextBox4.Text),
        //    TextBox3.Text,
        //    imagefilename);

        //ProductUtility.updateProduct(p);

        //Response.Redirect("~/Product.aspx");
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            Product p = ProductUtility.getProduct(id);
            TextBox6.Text = p.Id.ToString();
            TextBox1.Text = p.ProductName;
            TextBox4.Text = p.Price.ToString();
            //TextBox3.Text = p.Description;
            TextBox12.Text = p.Description;
            TextBox9.Text = p.Property;
            Image1.ImageUrl = "~/images/Products/" + p.ImageFileName;


            HiddenField1.Value = p.Id.ToString();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        int id = int.Parse(HiddenField1.Value);
        Product p = ProductUtility.getProduct(id);
        cart cart = new cart()
        {
            Id = p.Id,
            ProductName = p.ProductName,
            Price = p.Price,
            ImageFileName = p.ImageFileName,
            Quantity = int.Parse(TextBox2.Text)
        };

        List<cart> cartList = null;
        if (Session["cart"] != null)
        {
            cartList = Session["cart"] as List<cart>;
        }
        else
        {
            cartList = new List<cart>();
            Session["cart"] = cartList;
        }
        cartList.Add(cart);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">神奇寶貝商店
		</h2>
    </section>
    <!-- Product -->
    <div class="bg0 m-t-23 p-b-140">
        <div class="container">

            <!-- Body -->
            <section class="contact-section ">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <%--<h4 class="mtext-112 cl2 p-b-33 p-t-55">修改寵物資訊</h4>--%>
                            <%--<asp:Label ID="Label3" runat="server" Text="" CssClass="mtext-112 cl2 p-b-33 p-t-55"></asp:Label>--%>
                        </div>
                        <div class="col-lg-7">
                            <div class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None">編號 : </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None">名稱 : </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" placeholder="Enter Product Name" BorderStyle="None"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None">屬性 : </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" placeholder="Enter Product Name" BorderStyle="None"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None">價格 : </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" placeholder="Enter Product Price" BorderStyle="none"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" BorderStyle="None">描述 : </asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-sm-10">
                                        <div class="form-   group">
                                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control valid cl2 mtext-112 p-b-33" placeholder="Enter Product Description" BorderStyle="None" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <%--choose count box--%>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="mtext-104 cl3 txt-center num-product" value="1"></asp:TextBox>


                                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <asp:Button ID="Button1" runat="server" Text="加入購物車" CssClass="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" OnClick="Button1_Click1" OnClientClick="return alert('已成功加入購物車!')" />
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <div class="block2-pic hov-img0">
                                <asp:Image ID="Image1" runat="server" />
                            </div>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />

                        </div>
                    </div>
                </div>
            </section>

            <!-- Back Product -->
            <div class="flex-c-m flex-w w-full p-t-45">
                <asp:LinkButton ID="LinkButton1" runat="server" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" OnClick="LinkButton1_Click">Pokemons</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

