<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customerReport.aspx.cs" Inherits="Car_Rental.customerReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Creates customer report page--%>
     <br />
    <a href="~/AdminPage" runat="server"><< Back</a>
    <h1>Customers</h1>
 
    <table class="btn-primary-datetime" style="width: 85%">
        <tr>
            <td style="width: 6px">
                <asp:Label ID="Label1" runat="server" Text="First Name" Font-Bold="True"></asp:Label>
                :</td>
            <td style="width: 511px">
                <asp:TextBox ID="fName" runat="server" Width="268px" style="margin-left: 0"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 6px">
                <asp:Label ID="Label2" runat="server" Text="Last Name" Font-Bold="True"></asp:Label>
                :</td>
            <td style="width: 511px">
                <asp:TextBox ID="lName" runat="server" Width="268px" style="margin-left: 0"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td></td>
            <td style="width: 6px">
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></td>
        </tr>
    </table>
    <br />
    <%-- Creates customer report data table--%>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand"  DataKeyNames="customer_ID" BorderStyle="Double" Font-Bold="True" CellPadding="10" CellSpacing="5" Width="1219px" 
         >
        <AlternatingRowStyle BackColor="#CCCCCC" />
  <Columns>
            <asp:BoundField DataField="customer_ID" HeaderText="Customer ID"  InsertVisible="False" ReadOnly="True" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="customer_ID" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="lastName" />
            <asp:BoundField DataField="phoneNumber" HeaderText="Phone Number" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="phoneNumber" />
            <asp:BoundField DataField="address" HeaderText="Address" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="address" />
            <asp:BoundField DataField="zipCode" HeaderText="ZipCode" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="zipCode" />
            <asp:BoundField DataField="state" HeaderText="State" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="state" />
            <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="email" />
            <asp:BoundField DataField="driverLicenseNumber" HeaderText="Drivers License" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="driverLicenseNumber" />
            <asp:BoundField DataField="accountID" HeaderText="Account ID" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="accountID" />
            <asp:BoundField DataField="address2" HeaderText="Address 2" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="address2" />
            <asp:BoundField DataField="city" HeaderText="City" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" SortExpression="city" />
            <asp:ButtonField  HeaderText="Order Details" Text="Details" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="text-center" CommandName="Details"   />
        </Columns>
        <HeaderStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
    </asp:GridView>

    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

    

</asp:Content>
