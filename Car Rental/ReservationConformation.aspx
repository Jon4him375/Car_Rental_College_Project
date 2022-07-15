<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservationConformation.aspx.cs" Inherits="Car_Rental.ReservationConformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Order Conformation</h1>
    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" Text="Thank You For Making A Reservation!!"></asp:Label>
    <br />

     <asp:DataList ID="DataList1" runat="server" DataKeyField="reservationID" DataSourceID="SqlDataSource1" Width="615px" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
          <table>
<tr>
    <td>
        <asp:Label ID="Label1" runat="server" Text='<%# "Reservation Number: " + Eval("reservationID") %>' Font-Size="Large"></asp:Label>
    </td>
</tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label2" runat="server" Text='<%# "Reservation Name: " + Eval("firstName") +" "+ Eval("lastName") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label3" runat="server" Text='<%# "Contact Phone Number : " + Eval("phoneNumber") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label4" runat="server" Text='<%# "Conformation Email Sent To : " + Eval("email") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
               <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label5" runat="server" Text='<%# "Vehicle Reserved : " + Eval("year") +" "+ Eval("make") + " " + Eval("model") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >
                       <asp:Label ID="Label6" runat="server" Text='<%# "Dates Reserved : " + Eval("pickupDate") +" - "+ Eval("dropOffDate") %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >                      
                       <asp:Label ID="Label7" runat="server" Text='<%# "Total Price : " +"$"+ Eval("totalPrice")  %>' Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >                      
                       <asp:Label ID="Label9" runat="server" Text="" Font-Size="Large"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td  style="width: 672px;" >                      
                       <asp:Label ID="Label8" runat="server" Font-Size="Large" Visible="False" OnLoad="Label8_Load"></asp:Label>
                  </td>
              </tr>
          </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" >        
    </asp:SqlDataSource>
    <asp:Label ID="Label11" runat="server" Text="If You Have Any Questions Please Email Us At MparkCarRental@gmail.com"></asp:Label>
    
        
    
</asp:Content>
