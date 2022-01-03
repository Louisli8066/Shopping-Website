<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
            if (Session["userInfo"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Member m = Session["userInfo"] as Member;
                memberUtility.deleteMember(m.Id);
                Response.Redirect("~/index.aspx");
                
            }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Slider -->
    <section class="section-slide">
        <div class="wrap-slick1">
            <div class="slick1">
                <div class="item-slick1" style="background-image: url(images/qq.jpg);">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
                            <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                                <span style="color: chocolate" class="ltext-101 cl2 respon2">真的...要離開嗎?
                                </span>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                                <h2 style="color: navajowhite" class="ltext-201 cl2 p-t-19 p-b-43 respon1">皮卡丘哭哭
                                </h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                                <asp:Button OnClientClick="return confirm('真的要走嗎? Y_Y')" OnClick="Button1_Click" ID="Button1" runat="server" Text="忍痛刪除" CssClass="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

