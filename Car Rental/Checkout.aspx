<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Car_Rental.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Reservation Information</h1>
    <br />
    
    <table>
    <tr>
        <td><asp:Label ID="validationErrorLabel" runat="server" Text="" ForeColor="Red"></asp:Label></td>

    </tr>
    <tr>
            <td style="width: 135px">
                <asp:Label ID="Label4" runat="server" Text="First Name:" Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="firstName" runat="server"  Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server"  Font-Bold="True" Font-Size="12pt" Text="Last Name:"></asp:Label>
            </td>
            <td>
               
                <asp:TextBox ID="lastName"   Font-Size="12pt" runat="server" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server"  Font-Bold="True" Font-Size="12pt" Text="Phone Number:"></asp:Label>
            </td>
            <td>
               
                <asp:TextBox ID="phone" runat="server"   Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Email:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="email" runat="server"   Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Address:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="address" runat="server"  Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
            <tr>
                
            <td style="width: 135px">
                <asp:Label ID="Label25" runat="server" Text="Address(2):"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="address2" runat="server"   Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
                      <tr>
                
            <td style="width: 135px">
                <asp:Label ID="Label29" runat="server" Text="City:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="city" runat="server"   Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="State:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td >
                
                <asp:DropDownList ID="stateDropDown" runat="server" Width="220px">
                        <asp:ListItem Value="Alabama">Alabama</asp:ListItem>
	<asp:ListItem Value="Alaska">Alaska</asp:ListItem>
	<asp:ListItem Value="Arizona">Arizona</asp:ListItem>
	<asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
	<asp:ListItem Value="California">California</asp:ListItem>
	<asp:ListItem Value="Colorado">Colorado</asp:ListItem>
	<asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
	<asp:ListItem Value="District of Columbia">District of Columbia</asp:ListItem>
	<asp:ListItem Value="Delaware">Delaware</asp:ListItem>
	<asp:ListItem Value="Florida">Florida</asp:ListItem>
	<asp:ListItem Value="Georgia">Georgia</asp:ListItem>
	<asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
	<asp:ListItem Value="Idaho">Idaho</asp:ListItem>
	<asp:ListItem Value="Illinois">Illinois</asp:ListItem>
	<asp:ListItem Value="Indiana">Indiana</asp:ListItem>
	<asp:ListItem Value="Iowa">Iowa</asp:ListItem>
	<asp:ListItem Value="Kansas">Kansas</asp:ListItem>
	<asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
	<asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
	<asp:ListItem Value="Maine">Maine</asp:ListItem>
	<asp:ListItem Value="Maryland">Maryland</asp:ListItem>
	<asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
	<asp:ListItem Value="Michigan">Michigan</asp:ListItem>
	<asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
	<asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
	<asp:ListItem Value="Missouri">Missouri</asp:ListItem>
	<asp:ListItem Value="Montana">Montana</asp:ListItem>
	<asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
	<asp:ListItem Value="Nevada">Nevada</asp:ListItem>
	<asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
	<asp:ListItem Value="New Jersey">New Jersey</asp:ListItem>
	<asp:ListItem Value="New Mexico">New Mexico</asp:ListItem>
	<asp:ListItem Value="New York">New York</asp:ListItem>
	<asp:ListItem Value="North Carolina">North Carolina</asp:ListItem>
	<asp:ListItem Value="North Dakota">North Dakota</asp:ListItem>
	<asp:ListItem Value="Ohio">Ohio</asp:ListItem>
	<asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
	<asp:ListItem Value="Oregon">Oregon</asp:ListItem>
	<asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="Rhode Island">Rhode Island</asp:ListItem>
	<asp:ListItem Value="South Carolina">South Carolina</asp:ListItem>
	<asp:ListItem Value="SD">South Dakota</asp:ListItem>
	<asp:ListItem Value="South Dakot">Tennessee</asp:ListItem>
	<asp:ListItem Value="Texas">Texas</asp:ListItem>
	<asp:ListItem Value="Utah">Utah</asp:ListItem>
	<asp:ListItem Value="Vermont">Vermont</asp:ListItem>
	<asp:ListItem Value="Virginia">Virginia</asp:ListItem>
	<asp:ListItem Value="Washington">Washington</asp:ListItem>
	<asp:ListItem Value="West Virginia">West Virginia</asp:ListItem>
	<asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
	<asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Zip Code"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
               
                <asp:TextBox ID="zipCode" runat="server"   Font-Size="12pt" Width="220px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Vehicle "  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
               
                <asp:TextBox ID="vehicleText" runat="server" Font-Size="12pt" ReadOnly="True" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Pick Up Date:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="pickupDate" runat="server" Width="220px" ></asp:TextBox>
            </td>
        </tr>
                    <tr>
            <td style="width: 135px">
                <asp:Label ID="Label15" runat="server" Text="Pick Up Time:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="pickupTime" runat="server" Width="217px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Drop Off Date:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="dropOffDate" runat="server" Width="217px" OnTextChanged="dropOffDate_TextChanged" ></asp:TextBox>
            </td>
        </tr>
        
            
                    <tr>
            <td style="width: 135px">
                <asp:Label ID="Label16" runat="server" Text="Drop Off Time:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="dropOffTime" runat="server" Width="217px"></asp:TextBox>
            </td>
        </tr>
                    <tr>
            <td style="width: 135px">
                <asp:Label ID="Label14" runat="server" Text="Total Price:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
                        <td>
                <asp:TextBox ID="totalPriceText" runat="server" Width="217px" ReadOnly="True"></asp:TextBox>
            </td>
           
        </tr>
                     <tr>
            <td style="width: 135px">
                <asp:Label ID="Label17" runat="server" Text="Pay Now?:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="payNowChk" runat="server" ClientIDMode="Static" Text="Yes" OnCheckedChanged="payNowChk_CheckedChanged" />
            </td>
        </tr>
        </table>
        
  
        <div id="pay_online" runat="server" ClientIDMode="Static" style="display: none;" >

            <table class="btn-primary-datetime">
                <tr>
                    <td>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Credit Card Info"  Font-Bold="True" Font-Size="16pt"></asp:Label>
                        <br />
                    </td>
                       

                </tr>
                <tr>
                    <td  style="width: 135px">
                       
                    </td>
                    <td  style="width: 135px">
                         <asp:DropDownList ID="creditCardDrop" runat="server"  DataSourceID="SqlDataSource1" DataTextField="cardNumber" DataValueField="cardNumber" Width="220px" Visible="False" AppendDataBoundItems="True" OnSelectedIndexChanged="creditCardDrop_SelectedIndexChanged" OnTextChanged="creditCardDrop_TextChanged" OnLoad="creditCardDrop_Load" AutoPostBack="True">
         <asp:ListItem Selected="True">Please Select Credit Card</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  >
    </asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label18" runat="server" Text="Credit Card Number:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td>
                        
                <asp:TextBox ID="cardNumber" runat="server" Width="217px"></asp:TextBox>
            
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label19" runat="server" Text="Exp. Date (MM/DD/YYYY):"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="expDate" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                <asp:Label ID="Label20" runat="server" Text="CVC"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="cvc" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Label ID="Label26" runat="server" Text="Billing Info"  Font-Bold="True" Font-Size="16pt"></asp:Label>
                        <br />
                    </td>
                       

                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label24" runat="server" Text="Full Name:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="billingName" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label21" runat="server" Text="Address:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="billingAddress" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label28" runat="server" Text="Address(2):"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="billingAddress2" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label2" runat="server" Text="City:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="billingCity" runat="server" Width="217px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label22" runat="server" Text="State"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="billingState" runat="server" Width="220px">
                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
	<asp:ListItem Value="AK">Alaska</asp:ListItem>
	<asp:ListItem Value="AZ">Arizona</asp:ListItem>
	<asp:ListItem Value="AR">Arkansas</asp:ListItem>
	<asp:ListItem Value="CA">California</asp:ListItem>
	<asp:ListItem Value="CO">Colorado</asp:ListItem>
	<asp:ListItem Value="CT">Connecticut</asp:ListItem>
	<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	<asp:ListItem Value="DE">Delaware</asp:ListItem>
	<asp:ListItem Value="FL">Florida</asp:ListItem>
	<asp:ListItem Value="GA">Georgia</asp:ListItem>
	<asp:ListItem Value="HI">Hawaii</asp:ListItem>
	<asp:ListItem Value="ID">Idaho</asp:ListItem>
	<asp:ListItem Value="IL">Illinois</asp:ListItem>
	<asp:ListItem Value="IN">Indiana</asp:ListItem>
	<asp:ListItem Value="IA">Iowa</asp:ListItem>
	<asp:ListItem Value="KS">Kansas</asp:ListItem>
	<asp:ListItem Value="KY">Kentucky</asp:ListItem>
	<asp:ListItem Value="LA">Louisiana</asp:ListItem>
	<asp:ListItem Value="ME">Maine</asp:ListItem>
	<asp:ListItem Value="MD">Maryland</asp:ListItem>
	<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	<asp:ListItem Value="MI">Michigan</asp:ListItem>
	<asp:ListItem Value="MN">Minnesota</asp:ListItem>
	<asp:ListItem Value="MS">Mississippi</asp:ListItem>
	<asp:ListItem Value="MO">Missouri</asp:ListItem>
	<asp:ListItem Value="MT">Montana</asp:ListItem>
	<asp:ListItem Value="NE">Nebraska</asp:ListItem>
	<asp:ListItem Value="NV">Nevada</asp:ListItem>
	<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	<asp:ListItem Value="NM">New Mexico</asp:ListItem>
	<asp:ListItem Value="NY">New York</asp:ListItem>
	<asp:ListItem Value="NC">North Carolina</asp:ListItem>
	<asp:ListItem Value="ND">North Dakota</asp:ListItem>
	<asp:ListItem Value="OH">Ohio</asp:ListItem>
	<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	<asp:ListItem Value="OR">Oregon</asp:ListItem>
	<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	<asp:ListItem Value="SC">South Carolina</asp:ListItem>
	<asp:ListItem Value="SD">South Dakota</asp:ListItem>
	<asp:ListItem Value="TN">Tennessee</asp:ListItem>
	<asp:ListItem Value="TX">Texas</asp:ListItem>
	<asp:ListItem Value="UT">Utah</asp:ListItem>
	<asp:ListItem Value="VT">Vermont</asp:ListItem>
	<asp:ListItem Value="VA">Virginia</asp:ListItem>
	<asp:ListItem Value="WA">Washington</asp:ListItem>
	<asp:ListItem Value="WV">West Virginia</asp:ListItem>
	<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	<asp:ListItem Value="WY">Wyoming</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">
                <asp:Label ID="Label23" runat="server" Text="Zip Code:"  Font-Bold="True" Font-Size="12pt"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="billingZip" runat="server" Width="217px"></asp:TextBox><td>
                </tr>               
            </table>
        </div>
    <br />
          <a href="UserPage.aspx">  <asp:Label ID="editCustomerInfo" runat="server" Text="Customer Info Does Not Match Account. Please Update Customer Info." ForeColor="Red" Visible="False"></asp:Label></a>
    <br />
        <asp:Label ID="errorLabel" runat="server" Text="Selected Dates Not Available For This Vehicles" ForeColor="Red" Visible="False"></asp:Label>
        <br />
        <table>
            <tr>
            <td style="width: 135px">&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Reserve" Width="131px" OnClick="Button1_Click" />
            </td>
        </tr>
        </table>

          <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script><script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script><link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" /><!-- Bootstrap --><!-- Bootstrap DatePicker --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
        type="text/css" /><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"
        type="text/javascript"></script><!-- Bootstrap DatePicker --><script type="text/javascript">
                                                                         $(function () {
                                                                             $('[id*=pickupDate]').datepicker({
                                                                                 changeMonth: true,
                                                                                 changeYear: true,
                                                                                 format: "mm/dd/yyyy",
                                                                                 language: "tr"
                                                                             });
                                                                         });
                                                                         $(function () {
                                                                             $('[id*=dropOffDate]').datepicker({
                                                                                 changeMonth: true,
                                                                                 changeYear: true,
                                                                                 format: "mm/dd/yyyy",
                                                                                 language: "tr"
                                                                             });
                                                                         });
        </script>
      
    
     <script type="text/javascript">
         // jquery to hide/show the div where credit card info is
         $(document).ready(function () {
             $('#<%=payNowChk.ClientID %>').change(function () {
                 $('#pay_online').removeClass('hide-div')
                 if (this.checked) {
                     $('#pay_online').slideDown();
                 }
                 else {
                     $('#pay_online').slideUp();
                 }
             });
         });
     </script>


        
     
</asp:Content>
