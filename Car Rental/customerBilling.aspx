<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customerBilling.aspx.cs" Inherits="Car_Rental.customerBilling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container body-content" >
         <a href="~/CustomerReport" runat="server"><< Back</a>
         <br />
         <h2 style="text-align:left">Customer Bill</h2>
         
         <br />
                           
         <%--Creates the customer billing page--%>
    <table class="nav-justified" style="width: 33%">
        <tr>
            <td style="width: 203px"> Reservation ID</td>
            <td >
                   <asp:DropDownList ID="ReservationNumber" runat="server"  DataSourceID="SqlDataSource1" DataTextField="reservationID" DataValueField="reservationID"   AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ReservationNumber_SelectedIndexChanged" Width="185px" >
         <asp:ListItem Selected="True">Please Select Reservation ID</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  >
    </asp:SqlDataSource>
            </td>
        </tr>
          <tr >
            <td style=" width: 203px">Customer ID</td>
            <td>
                <asp:TextBox ID="id" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        
        <tr >
            <td style=" width: 203px">First Name</td>
            <td>
                <asp:TextBox ID="firstName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 203px" >Last Name</td>
            <td>
                <asp:TextBox ID="lastName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width: 203px">phoneNumber</td>
            <td>
                <asp:TextBox ID="phoneNumber" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width: 203px">Bill</td>
            <td>
               
                <asp:TextBox ID="bill" runat="server" ReadOnly="True" ></asp:TextBox>
               
            </td>
        </tr>
        <tr>
            <td style=" width: 203px">Make</td>
            <td>
               
                <asp:TextBox ID="make" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td style=" width: 203px">Model</td>
            <td>
               
                <asp:TextBox ID="model" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
           <tr>
            <td style=" width: 203px">Card Number</td>
            <td>
               
                <asp:TextBox ID="cardNumber" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
           <tr>
            <td style=" width: 203px">Pick up date </td>
            <td>
               
                <asp:TextBox ID="pickUp" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
           <tr>
            <td style=" width: 203px">Drop Off Date</td>
            <td>
               
                <asp:TextBox ID="dropOff" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td></td>
            <td style="width: 6px">
                <asp:Button ID="Button2" runat="server" Text="Download" OnClick="Button2_Click" /></td>
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
               
            </td>
        </tr>
        </table>
   
</asp:Content>