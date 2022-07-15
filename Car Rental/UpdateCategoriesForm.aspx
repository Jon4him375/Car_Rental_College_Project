<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateCategoriesForm.aspx.cs" Inherits="Car_Rental.UpdateCategoriesForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container body-content" >
         <h2 style="text-align:left">Update Categories</h2>
         
         <br />
    <table class="nav-justified" style="width: 33%">
        <tr >
            <td style=" width: 203px">Name</td>
            <td>
                <asp:TextBox ID="CategoriesName" runat="server"></asp:TextBox>
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
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Save" Width="70px" style="height: 26px" />
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