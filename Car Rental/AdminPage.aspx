<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Car_Rental.AdminPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="text-align: center">Admin Page</h1>
    <br />
    <br />
    <div class="row" style="text-align: center">
        <asp:Button CssClass="btn btn-primary form-control" ID="Button2" runat="server" Text="Add Vehicles" OnClick="Button2_Click" style="margin-right:50px;" Width="150px" />
        <asp:Button CssClass="btn btn-primary form-control" ID="Button1" runat="server" Text="Add Categories" OnClick="Button1_Click" style="margin-right:50px;" Width="150px" />

        <asp:Button ID="Button3" CssClass="btn btn-primary form-control" runat="server" Text="Edit Vehicles" OnClick="Button3_Click" style="margin-right:50px;" Width="150px" />

        <asp:Button ID="Button4" CssClass="btn btn-primary form-control" runat="server" Text="Edit Categories" OnClick="Button4_Click" style="margin-right:50px;" Width="150px" />

        <asp:Button ID="Button5" CssClass="btn btn-primary form-control" runat="server" Text="View Customers" OnClick="Button5_Click" style="margin-right:50px;" Width="150px"/>

    </div>
</asp:Content>
