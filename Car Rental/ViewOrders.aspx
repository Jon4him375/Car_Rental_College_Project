<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="Car_Rental.ViewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h1 style=" text-align: center">View Orders</h1>
 
     <asp:DataList ID="DataList1" runat="server" DataKeyField="reservationID" Width="615px" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="3">
        <ItemTemplate>
          <table style="margin-left: 75px; text-align: center;">
<tr>
    <td>
        <asp:Label ID="Label1" runat="server" Text='<%# "Reservation Number: " + Eval("reservationID") %>' Font-Size="Large"></asp:Label>
    </td>
</tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label2" runat="server" Text='<%#  Eval("year") +" "+ Eval("make") + " " + Eval("model") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >
                        <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Height="230px" ImageUrl='<%# Eval("img") %>' Width="300px" />
              </tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label4" runat="server" Text='<%# "Pick Up Date: " + Eval("pickupDate")  %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
               <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label5" runat="server" Text='<%# "Drop Off Date: " + Eval("dropOffDate")  %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>             
              <tr>
                  <td  style="width: 672px;" >                      
                       <asp:Label ID="Label7" runat="server" Text='<%# "Total Price : " +"$"+ Eval("totalPrice")  %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
             
              
          </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" >        
    </asp:SqlDataSource>
    <asp:Label ID="Label11" runat="server" Text="If You Have Any Questions Please Email Us At MparkCarRental@gmail.com"></asp:Label>
    
        
    
</asp:Content>
