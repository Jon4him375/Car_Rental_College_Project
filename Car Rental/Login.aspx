<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="Car_Rental.Login" %>
<asp:Content ID="Header" ContentPlaceHolderID="MainContent" runat="server">
    <!--This page will allow users to sign in into their account-->

    <div class="container body-content">
            <h2 style ="text-align:center"> User Login </h2>
            <br />

            <!--Login Table-->
            <table class="nav-justified" style = "margin: auto; width: 43%; text-align: left;">
                <tr style ="height: 30px">
                    <td style="width:92px">Email </td>
                    <td style="width: 422px"><asp:TextBox ID="emailText" runat="server" Width="403px" TextMode="Email" Height="22px"></asp:TextBox></td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:92px">Password</td>
                    <td style="width: 422px"><asp:TextBox textMode="Password" ID="passwordText" runat="server" Width="403px" Height="22px"></asp:TextBox></td>
                </tr> 
                <tr>
                    <td></td>
                    <td>
                        <!--Error msg for end user-->
                        <asp:Label ID="ErrorMsg" runat="server" Text="" CssClass="alert-warning"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <!--Register link-->
                    <td>Don't have an account?<br /> <a runat="server" href="~/Registration"> Click here to register!</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="width: 110px">
                        <!--Submit button-->
                        <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="btn-primary" OnClick="Login_Click" />
                    </td>
                </tr>
            </table>
                
    </div>
</asp:Content>