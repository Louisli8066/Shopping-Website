<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">


    protected void Button1_Click(object sender, EventArgs e)
    {
        List<Member> mList = memberUtility.GetMembers();
        Member repeat = mList.SingleOrDefault(s => s.Account == TextBox1.Text || s.Email == TextBox3.Text);
        if (repeat == null)
        {
            Member m = new Member(
                        0,
                        TextBox1.Text,
                        TextBox2.Text,
                        TextBox3.Text,
                        TextBox4.Text
                        );
            memberUtility.addMember(m);
            Response.Redirect("~/memberInfo.aspx");
        }
        else
        {
            Label1.Text = "帳號名稱或email重複";
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Title page -->
    <div class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">加入會員
        </h2>
    </div>


    <!-- Content page -->
    <div class="bg0 p-t-104 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <div>
                        <div class="bor8 m-b-20 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox1" placeholder="帳號" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>

                        <div class="bor8 m-b-30 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox2" placeholder="密碼" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>
                        <div class="bor8 m-b-30 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox3" placeholder="Email" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>
                        <div class="bor8 m-b-30 how-pos4-parent">
                            <asp:TextBox CssClass="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" ID="TextBox4" placeholder="姓名" runat="server"></asp:TextBox>
                            <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>

                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button CssClass="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" ID="Button1" runat="server" Text="加入會員" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

