<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Member m = memberUtility.GetMember(TextBox1.Text, TextBox2.Text);
        if (m == null)
        {
            Label1.Text = "帳號或密碼有誤，請重新輸入";
        }
        else
        {
            Session["userInfo"] = m;
            Response.Redirect("~/memberInfo.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/register.aspx");
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <div class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">訓練家登入
        </h2>
    </div>


    <!-- Content page -->
    <div class="bg0 p-t-104 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <div>
                        <h4 class="mtext-105 cl2 txt-center p-b-30">登入吧，小智!
                        </h4>

                        <div class="bor8 m-b-20 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox1" placeholder="訓練家帳號" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>

                        <div class="bor8 m-b-30 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox2" placeholder="訓練家密碼" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>
                        <asp:Button CssClass="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>

                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <div>

                        <h4 class="mtext-105 cl2 txt-center p-b-30">還不是訓練家?
                        </h4>
                        <br />
                        <br />
                        <h6 class="mtext-105 cl2 txt-center p-b-30">快加入吧!
                        </h6>
                        <br />
                        <br />
                        <asp:Button Enabled="true" CssClass="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" ID="Button2" runat="server" Text="加入會員" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

