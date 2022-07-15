<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewVehicle.aspx.cs" Inherits="Car_Rental.ViewVehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
           <div class="panel-heading" style="text-align:center" ><h1>Vehicle Information</h1></div>
       </div>
     
    
    <div class="jumbotron">
       
 <table>
        <tr>
            <td style="width: 672px;" >
                <asp:DataList ID="DataList1" runat="server" DataKeyField="vehicleID" DataSourceID="SqlDataSource1" Width="193px"  OnItemDataBound="DataList1_ItemDataBound"  OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <table style="margin-left: 50%; ">
                <tr style=" text-align:center; margin-left: auto;  margin-right: auto;">
                    <td style="text-align:center;">
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") +" " + Eval("make") +" "+ Eval("model") %>' Font-Bold="True" Font-Size="18pt"></asp:Label>                       
                        <asp:Label ID="Label27" runat="server" Text='<%# Eval("vehicleID") %>' Font-Bold="True" Font-Size="18pt" Visible="false"></asp:Label>
                  
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="400px" Width="500px" ImageUrl='<%# Eval("img") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;">
                        <asp:Label ID="Label30" runat="server" Text='<%# "The Vehicle Can Hold Up To: " + Eval("luggage") + " Bags" %>' Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="text-align:center;">
                        <asp:Label ID="Label32" runat="server" Text='<%# "The Vehicle Has a: " + Eval("transmission") + " Transmission" %>' Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                </tr>
                <tr>
                <tr>
                     <tr>
                    <td style="text-align:center;">
                        <asp:Label ID="Label31" runat="server" Text='<%# "The Vehicle Gets: " + Eval("mpg") + " MPG" %>' Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;">
                        <br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>' Font-Size="10pt"></asp:Label> <asp:Label ID="hiddenPrice" runat="server" Text='<%# Eval("price") %>' Visible="false" Font-Size="10pt"></asp:Label> 
                    </td>
                </tr>
                <
                <tr>
                    <td style="text-align:center;">
                        <asp:Label ID="totalPriceLbl" runat="server" Text='<%# "$" + String.Format("{0:#.00}", Eval("price")) + " Per Day"%>' Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Reserve" style=" text-align: center;" />

                    </td>
                </tr>
            </table>
            
            <br />
        </ItemTemplate>
    </asp:DataList>
                
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" >
        
    </asp:SqlDataSource>

            </td>
        </tr>
     </table>
     </div>
</asp:Content>