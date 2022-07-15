<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateVehiclesForm.aspx.cs" Inherits="Car_Rental.UpdateVehiclesForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container body-content" >
         <h2 style="text-align:left">Update Vehicles</h2>
         
         <br />
    <table class="nav-justified" style="width: 33%">
        <tr >
            <td style=" width: 203px">Make</td>
            <td>
                <asp:TextBox ID="make" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 203px" >Model</td>
            <td>
                <asp:TextBox ID="model" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width: 203px">Year</td>
            <td>
                <asp:TextBox ID="year" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 203px">Color</td>
            <td style="height: 20px">
                <asp:TextBox ID="color" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 203px">Category</td>
            <td style="height: 20px">
                <asp:DropDownList ID="category" runat="server" DataSourceID="SqlDataSource3" DataTextField="CategoriesName" DataValueField="CategoriesName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoriesName] FROM [Categories]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style=" height: 20px; width: 203px">License Plate</td>
            <td style="height: 20px">
                <asp:TextBox ID="licensePlate" runat="server" Width="119px"></asp:TextBox>
            </td>
        </tr>
         <tr >
            <td style=" width: 203px">Vin Number</td>
            <td>
                <asp:TextBox ID="vin" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td style="height: 20px; width: 203px">Price</td>
            <td style="height: 20px">
                <asp:TextBox ID="price" runat="server" Width="119px"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td style=" width: 203px">Transmission</td>
            <td>
                <asp:DropDownList ID="transmission" runat="server">
                    <asp:ListItem>Automatic</asp:ListItem>
                    <asp:ListItem>Manuel</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr >
            <td style=" width: 203px">MPG</td>
            <td>
                <asp:TextBox ID="mpg" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td style=" width: 203px">Doors</td>
            <td>
                <asp:TextBox ID="doors" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td style=" width: 203px">Luggage</td>
            <td>
                <asp:TextBox ID="luggage" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td style="height: 20px; width: 203px">Description</td>
            <td style="height: 20px">
                <asp:TextBox ID="description" runat="server" Width="222px" Height="95px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>  
        <tr>
        <td style="width: 203px">
                <asp:Label ID="Label17" runat="server" Text="Change Image?"  Font-Bold="True" Font-Size="10pt"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="changeImg" runat="server" ClientIDMode="Static" Text="Yes" />
            </td>
        </tr>       
        
    </table>
         </div>
    <div id="fileUpload" runat="server" ClientIDMode="Static" style="display: none;" class="hide-div">
        <table>
            <tr>
                <td style="height: 20px; width: 203px">Image</td>
                <td style="height: 20px; width: 203px"">
                    <asp:FileUpload ID="image" runat="server" Width="221px" />
                </td>
            </tr>
        </table>
        
    </div>
    
    <table>
    <tr>
            <td style="height: 20px; width: 203px"></td>
            <td style="width: 203px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Save" Width="70px" />
            </td>
        </tr>
        </table>
    <script type="text/javascript">
         // jquery to hide/show the div where credit card info is
         $(document).ready(function () {
             $('#<%=changeImg.ClientID %>').change(function () {
                 $('#fileUpload').removeClass('hide-div')
                 if (this.checked) {


                     $('#fileUpload').slideDown();

                 }
                 else {

                     $('#fileUpload').slideUp();

                 }
             });
         });
    </script>
</asp:Content>
