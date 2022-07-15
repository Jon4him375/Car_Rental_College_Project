<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Registration.aspx.cs" Inherits="Car_Rental.Registration" %>




<asp:Content ID="Header" ContentPlaceHolderID="MainContent" runat="server">
    <!--This page will be used to allow users to register for an account.
        The user will have to input information required to fill out for an account, and customer rows within the database
        Also an option to input credit card infromation for the Credit_Card table
        Account [accountID, userName, password, userRole = customer by default?]
            - User will only have to fill out userName and password
        Customer [customer_ID, firstName, lastName, phoneNumber, address, zipCode, state, email, driverLicenseNumber, accountID, credit_CardID]
            - User will only have to fill out everything except customer_ID, accountID(FK), and credit_CardID(FK)
        Credit_Card [credit_CardID, cardNumber, expDate, cvc, billingAddress, billingState, billingZipCode, billingFirstName, billingLastName]
            - If user opts into entering credit card info they will have to fill out everything except credit_CardID-->

    <div class="container body-content">
        <h2 style ="text-align:center"> User Registration </h2>
        <asp:HiddenField ID="HiddenField1" runat="server"  />
        <asp:HiddenField ID="HiddenEmail" runat="server"  />

        <br />
        <div id="accountCreation" style ="display: block" runat="server">
            <!--Email and password-->
            <p style ="text-align:center"><b>Please enter your email and password below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 43%; text-align: left;">
                <tr style ="height: 30px">
                    <td style="width:92px">Email </td>
                    <td style="width: 422px"><asp:TextBox ID="emailText" runat="server" Width="403px" TextMode="Email" Height="22px"></asp:TextBox></td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:92px">Password</td>
                    <td style="width: 422px"><asp:TextBox textMode="Password" ID="passwordText1" runat="server" Width="403px" Height="22px"></asp:TextBox></td>
                </tr>    
                <tr style ="height: 30px">
                    <td style="width:92px">Confirm Password</td>
                    <td style="width: 422px"><asp:TextBox textMode="Password" ID="passwordText2" runat="server" Width="403px" Height="22px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="ErrorMsg" runat="server" Text="Passwords must contain at least...<br>One upper case letter<br>One lower case letter<br>One digit<br>One special character" CssClass="alert-warning"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <!--Continue Button-->
            <table class="nav-justified" style = "margin: auto; width: 0%; text-align: left;">
                <tr>
                    <td style="width: 110px">
                        <asp:Button ID="continueButton" runat="server" Text="Continue" CssClass="btn-primary" OnClick="Continue_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <!--User Profile-->
        <!--Customer [customer_ID, firstName, lastName, phoneNumber, address, zipCode, state, driverLicenseNumber, accountID, credit_CardID]-->
        <div id="customerInfo" style="display: none" runat="server">
            <p style ="text-align:center"><b>Please enter your profile data below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 33%; text-align: left;">
                <tr style ="height: 30px">
                    <td style="width:481px">First Name</td>
                    <td style="width: 533px"><asp:TextBox ID="firstNameText" runat="server" Width="403px"></asp:TextBox></td>
                    <td>Required</td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:481px">Last Name</td>
                    <td style="width: 533px"><asp:TextBox ID="lastNameText" runat="server" Width="403px"></asp:TextBox></td>
                    <td>Required</td>

                </tr>    
                <tr style ="height: 30px">
                    <td style="width:481px">Phone Number</td>
                    <td style="width: 533px"><asp:TextBox ID="phoneNumberText" runat="server" Width="403px"></asp:TextBox></td>
                    <td>Required<br />Area code is Required. </td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:481px">Address 1</td>
                    <td style="width: 533px"><asp:TextBox ID="address1Text" runat="server" Width="403px"></asp:TextBox></td>
                </tr>  
                 <tr style ="height: 30px">
                    <td style="width:481px">Address 2</td>
                    <td style="width: 533px"><asp:TextBox ID="address2Text" runat="server" Width="403px"></asp:TextBox></td>
                </tr> 
                <tr style ="height: 30px">
                    <td style="width:481px">City</td>
                    <td style="width: 533px"><asp:TextBox ID="cityText" runat="server" Width="403px"></asp:TextBox></td>
                </tr> 
                <tr style ="height: 30px">
                    <td style="width:481px">Zip Code</td>
                    <td style="width: 533px"><asp:TextBox ID="zipCodeText" runat="server" Width="403px"></asp:TextBox></td>
                </tr>            
                <tr style ="height: 30px">
                    <td style="width:481px">State</td>
                    <td style="width: 533px">
                        <asp:DropDownList ID="stateDropDown" runat="server" Width="403px">
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
	<asp:ListItem Value="South Dakota">South Dakota</asp:ListItem>
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
                <tr style ="height: 30px">
                    <td style="width:481px">Driver License Number</td>
                    <td style="width: 533px"><asp:TextBox ID="driverLicenseNumberText" runat="server" Width="403px"></asp:TextBox></td>
                    <td>Required</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                         <asp:Label ID="userDataError" runat="server" Text="" CssClass="alert-warning"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />

            <!--Credit Card-->
            <!--Credit_Card [credit_CardID, cardNumber, expDate, cvc, billingAddress, billingState, billingZipCode, billingFirstName, billingLastName]-->
        

            <!--Back and Submit Button-->
            <table class="nav-justified" style = "margin: auto; width: 0%; text-align: left;">
                <tr>
                    <td style="width: 110px">
                         <asp:Button ID="Previous" runat="server" Text="Previous" CssClass="btn-primary" OnClick="Previous_Click" />
                    </td>
                    <td></td>
                    <td>
                         <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn-primary" OnClick="Submit_Click1" />
                    </td>
                </tr>
            </table>
        </div>


        <!--Confrimation of account creation-->
        <div id="confrimDiv" style="display: none" runat="server">
            <p style ="text-align:center"><b>Thank you for registering, please check your inbox for a confrimation email!</b></p> 
        </div>


    </div>
</asp:Content>
