<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Vehicles.aspx.cs" Inherits="Car_Rental.Edit_Vehicles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:16px;">
        <a href="~/AdminPage" runat="server"><< Back</a>
    </div>
    <h1>Edit Vehicles</h1>
    <div class="row mx-auto">
        
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Make:" Font-Bold="True"></asp:Label>
            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Width="268px" Style="margin-left: 0"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Model:" Font-Bold="True"></asp:Label>
            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Width="268px" Style="margin-left: 0"></asp:TextBox>
        </div>
        <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
    </div>
    <br />
    <div class="row mx-auto">

        <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataKeyNames="vehicleID" BorderStyle="Double" Font-Bold="True" CellPadding="10" CellSpacing="5" Width="1219px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                
               
                <asp:BoundField DataField="vehicleID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="vehicleID" />
                <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" />
                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                <asp:BoundField DataField="vinNumber" HeaderText="Vin Number" SortExpression="vinNumber" />
                <asp:BoundField DataField="license_plate" HeaderText="License Plate" SortExpression="license_plate" />
                <asp:BoundField DataField="CategoriesName" HeaderText="Category" SortExpression="CategoriesName" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                <asp:BoundField DataField="luggage" HeaderText="Luggage" SortExpression="luggage" />
                <asp:BoundField DataField="mpg" HeaderText="MPG" SortExpression="mpg" />
                <asp:BoundField DataField="doors" HeaderText="Doors" SortExpression="doors" />
                <asp:BoundField DataField="transmission" HeaderText="Transmission" SortExpression="transmission" />
                <asp:BoundField DataField="img" HeaderText="Image" SortExpression="img" />
                <asp:ButtonField HeaderText="Edit" Text="Edit" CommandName="Edit" />
            </Columns>
            <HeaderStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
        </asp:GridView>
    </div>



</asp:Content>
