<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Categories.aspx.cs" Inherits="Car_Rental.Add_Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <a href="~/AdminPage" runat="server"><< Back</a>
     <h2 style="text-align: left">Add Category</h2>
    <br />
    <div class="row">
        <div class="form-group">
    <asp:Label runat="server" Text="Category Name"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="categoryNameTxt" runat="server" Width="208px" Height="25px" ></asp:TextBox>                
        </div>
        <div class="form-group">
             <asp:Label runat="server" Text="Image"></asp:Label>
            <asp:FileUpload CssClass="form-control" ID="FileUpload2" runat="server" Width="234px" />
        </div>
        <asp:Button CssClass="form-control btn btn-primary" ID="Button2" runat="server" OnClick="Button2_Click" Text="Save" Width="77px" />
    </div>
</asp:Content>
