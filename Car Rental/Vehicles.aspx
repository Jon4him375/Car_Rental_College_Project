<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="Car_Rental.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    </asp:Content>
   <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">   
       <table>
    </table>
   <h1 style="text-align:center;">Rental Vehicles</h1>
       <asp:DataList ID="DataList1" runat="server" DataKeyField="vehicleID" DataSourceID="SqlDataSource2" Height="293px" Width="505px" RepeatDirection="Horizontal" RepeatColumns="3">
           <ItemTemplate>
             <table style="margin-left: 75px; text-align: center;">
                 <tr>
                     <td style="text-align:center;">
                         <br />
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") +" " + Eval("make") +" "+ Eval("model") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                     </td>
                     <td style="text-align:center;">
                         <br />
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("vehicleID")  %>' Font-Bold="True" Font-Size="Large" Visible="False"></asp:Label>
                     </td>
                 </tr>
                  
                  <tr>
                     <td>
                         <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Height="230px" ImageUrl='<%# Eval("img") %>' Width="300px" />
                     </td>
                 </tr>                 
                  
                  <tr>
                     <td style="text-align:center;">
                         <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# "$" + String.Format("{0:#.00}", Eval("price")) + " Per Day"%>'></asp:Label>
                         <br />
                         <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
                     </td>
                 </tr>
             </table>

           </ItemTemplate>
    </asp:DataList>
       
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
 

   
        


     </asp:Content>

