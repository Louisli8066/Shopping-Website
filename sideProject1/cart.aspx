<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["cart"] == null)
            {
                Response.Redirect("~/product.aspx");
            }
            else
            {
                List<cart> cList = Session["cart"] as List<cart>;
                Repeater1.DataSource = cList;
                Repeater1.DataBind();
                Label1.Text = cList.Sum(c => c.Total).ToString();
            }
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        List<cart> cList = Session["cart"] as List<cart>;
        foreach (RepeaterItem item in Repeater1.Items)
        {
            TextBox tb = item.FindControl("TextBox1") as TextBox;
            int quantity = int.Parse(tb.Text);

            HiddenField hf = item.FindControl("HiddenField1") as HiddenField;
            int id = int.Parse(hf.Value);

            cList.SingleOrDefault(c => c.Id == id).Quantity = quantity;
        }
        Repeater1.DataSource = cList;
        Repeater1.DataBind();
        Label1.Text = cList.Sum(c => c.Total).ToString();
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    List<cart> cList = Session["cart"] as List<cart>;
    //    foreach (RepeaterItem item in Repeater1.Items)
    //    {
    //        TextBox tt = item.FindControl("TextBox2") as TextBox;
    //        string coupon = tt.Text;
    //        if (coupon == "louis" && int.Parse(Label1.Text) >= 1000)
    //        {
    //            Label1.Text = (int.Parse(Label1.Text) - 100).ToString();
    //        }
    //        else
    //        {
    //            tt.Text = "不適用此優惠券";
    //        }
    //    }
    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        List<cart> cList = new List<cart>();
        Session["cart"] = cList;
        Repeater1.DataSource = cList;
        Repeater1.DataBind();
        Label1.Text = "";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">購物車
		</h2>
    </section>


    <!-- Shoping Cart -->
    <div class="bg0 p-t-75 p-b-85">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                            <div class="m-l-25 m-r--38 m-lr-0-xl">
                                <div class="wrap-table-shopping-cart">
                                    <table class="table-shopping-cart">
                                        <tr class="table_head">
                                            <th class="column-1">神奇寶貝</th>
                                            <th class="column-2"></th>
                                            <th class="column-3">單價</th>
                                            <th class="column-1">數量</th>
                                            <th class="column-1">總價</th>
                                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="table_row">
                            <td class="column-1">
                                <div class="how-itemcart1">
                                    <img src='<%# Eval("ImageFileName","/images/Products/{0}") %>' alt="IMG">
                                </div>
                                <asp:HiddenField ID="HiddenField1" Value='<%# Eval("Id") %>' runat="server" />
                            </td>
                            <td class="column-2"><%# Eval("ProductName") %></td>
                            <td class="column-3">$ <%# Eval("Price") %></td>
                            <td class="column-4">
                                <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                    <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                        <i class="fs-16 zmdi zmdi-minus"></i>
                                    </div>

                                    <%--<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="1">--%>
                                    <asp:TextBox ID="TextBox1" CssClass="mtext-104 cl3 txt-center num-product" runat="server" value="1" Text='<%# Eval("Quantity") %>'></asp:TextBox>

                                    <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                        <i class="fs-16 zmdi zmdi-plus"></i>
                                    </div>
                                </div>
                            </td>
                            <td class="column-5">$ <%# Eval("Total") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                        </div>

                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                            <div class="flex-w flex-m m-r-20 m-tb-5">
                                <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" placeholder="Coupon Code"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="使用優惠券" CssClass="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" />--%>
                            </div>
                            <asp:Button ID="Button2" OnClick="Button2_Click" runat="server" Text="更新購物車" CssClass="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" /><br />
                            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="清空購物車" CssClass="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" />

                        </div>
                        </div>
                </div>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                        <h4 class="mtext-109 cl2 p-b-30">購物車一覽
						</h4>

                        <div class="flex-w flex-t p-t-27 p-b-33">
                            <div class="size-208">
                                <span class="mtext-101 cl2">總金額:
								</span>
                            </div>

                            <div class="size-209 p-t-1">
                                <span class="mtext-110 cl2">$<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </span>
                            </div>
                        </div>

                        <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            結帳
					
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>













    <%--<div class="bg0 p-t-75 p-b-85">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1">神奇寶貝</th>
                                    <th class="column-2"></th>
                                    <th class="column-3">單價</th>
                                    <th class="column-1">數量</th>
                                    <th class="column-1">總價</th>
                                </tr>

                                <tr class="table_row">
                                    <td class="column-1">
                                        <div class="how-itemcart1">
                                            <img src="images/item-cart-04.jpg" alt="IMG">
                                        </div>
                                    </td>
                                    <td class="column-2">Fresh Strawberries</td>
                                    <td class="column-3">$ 36.00</td>
                                    <td class="column-4">
                                        <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="1">

                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="column-5">$ 36.00</td>
                                </tr>
                            </table>
                        </div>

                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                            <div class="flex-w flex-m m-r-20 m-tb-5">
                                <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">

                                <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                    使用優惠券
							
                                </div>
                            </div>

                            <div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                                更新購物車
						
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                        <h4 class="mtext-109 cl2 p-b-30">購物車總價
						</h4>

                        <div class="flex-w flex-t bor12 p-b-13">
                            <div class="size-208">
                                <span class="stext-110 cl2">小記:
								</span>
                            </div>

                            <div class="size-209">
                                <span class="mtext-110 cl2">$79.65
								</span>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-27 p-b-33">
                            <div class="size-208">
                                <span class="mtext-101 cl2">最終金額:
								</span>
                            </div>

                            <div class="size-209 p-t-1">
                                <span class="mtext-110 cl2">$79.65
								</span>
                            </div>
                        </div>

                        <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            結帳
					
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

