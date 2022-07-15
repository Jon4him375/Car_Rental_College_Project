<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Car_Rental.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 16px;">
        <a href="~/AdminPage" runat="server"><< Back</a>
    </div>
    <div class="container body-content">
        <h2 style="text-align: left">Add Vehicle</h2>

        <br />
        <div class="row">
            <div class="form-group">
                <asp:Label runat="server" Text="Make"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Model"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Year"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Color"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Category"></asp:Label>

                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="CategoriesName" DataValueField="CategoriesName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoriesName] FROM [Categories]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="License Plate"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" ></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label runat="server" Text="Vin Number"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" ></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Price"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" ></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Transmission"></asp:Label>
                <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                    <asp:ListItem>Automatic</asp:ListItem>
                    <asp:ListItem>Manuel</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="MPG"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Doors"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Luggage"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Description"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"  Height="95px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Image"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" Width="221px" />
            </div>
            <asp:Button CssClass="btn btn-primary form-control" ID="Button4" runat="server" OnClick="Button1_Click1" Text="Save" Width="70px" />

        </div>
    </div>
 
</asp:Content>

