
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Categories.aspx.cs" Inherits="Car_Rental.Edit_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:16px;">
        <a href="~/AdminPage" runat="server"><< Back</a>
    </div>
    <h1>Edit Category</h1>
   <!-- <table class="btn-primary-datetime" style="width: 85%">
        <tr>
            <td style="width: 6px">
                <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                :</td>
            <td style="width: 511px">
                <asp:TextBox ID="TextBox1" runat="server" Width="268px" style="margin-left: 0"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 6px">
                <asp:Label ID="Label2" runat="server" Text="Image" Font-Bold="True"></asp:Label>
                :</td>
            <td style="width: 511px">
                <asp:TextBox ID="TextBox2" runat="server" Width="268px" style="margin-left: 0"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td></td>
            <td style="width: 6px">
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></td>
        </tr>
    </table>-->
    <br />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"  DataKeyNames="CategoriesName" BorderStyle="Double" Font-Bold="True" CellPadding="10" CellSpacing="5" Width="1219px" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
             
            
            <asp:BoundField DataField="CategoriesName" HeaderText="CategoriesName" SortExpression="CategoriesName" />          
            <asp:BoundField DataField="img" HeaderText="Image" SortExpression="img" />
            <asp:ButtonField  HeaderText="Edit" Text="Edit" CommandName="Edit"   />
        </Columns>
        <HeaderStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
    </asp:GridView>
     
         
    <br />
</asp:Content>
     
