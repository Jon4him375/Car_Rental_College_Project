<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserPage.aspx.cs" Inherits="Car_Rental.UserPage" %>

<asp:Content ID="Header" ContentPlaceHolderID="MainContent" runat="server">


    <script language="JavaScript">
    var nav = window.Event ? true : false;
    if (nav) {
        window.captureEvents(Event.KEYDOWN);
        window.onkeydown = NetscapeEventHandler_KeyDown;
    } else {
        document.onkeydown = MicrosoftEventHandler_KeyDown;
    }

    function NetscapeEventHandler_KeyDown(e) {
        if (e.which == 13 && e.target.type != 'textarea' && e.target.type != 'submit') { return false; }
        return true;
    }

    function MicrosoftEventHandler_KeyDown() {
        if (event.keyCode == 13 && event.srcElement.type != 'textarea' && event.srcElement.type != 'submit')
            return false;
        return true;
        }
    </script>

    <!--This page will allow a user to change various things about there account-->
     <div class="container body-content">
        <h2 id="welcome" runat="server" style ="text-align:center">Welcome [user_Name_Here] </h2>
        <asp:HiddenField ID="HiddenFirstName" runat="server"  />

        <!--Allow users to choose what to view/change-->
        <div id="customerInfo" style="display: block" runat="server">
            <p style ="text-align:center"><b>Please select what you would like to do.</b></p> 
            <div style="text-align: center;">
                            <asp:Button ID="btnInfo" runat="server" Text="Update user infromation" CssClass="btn-primary" style="margin-right: 50px;" OnClick="btnUserInfo" type="button" UseSubmitBehavior="False" />
                   
                            <asp:Button ID="btnPass" runat="server" Text="Change password" CssClass="btn-primary" style="margin-right: 50px;" OnClick="btnUserPass" type="button" UseSubmitBehavior="False"/>
                  
                            <asp:Button ID="btnCreditCard" runat="server" Text="Update credit card" CssClass="btn-primary" OnClick="btnUserCreditCard" type="button" UseSubmitBehavior="False"/>
                </div>
        </div>
        <!--User Profile-->
        <div id="userInfo" style="display: none" runat="server">
            <p style ="text-align:center"><b>Please enter your profile data below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 33%; text-align: left;">
                <tr style ="height: 30px">
                    <td style="width:481px">Email</td>
                    <td style="width: 533px"><asp:TextBox ID="emailText" runat="server" Width="403px"></asp:TextBox></td>
                    <td>Required</td>
                </tr>
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
                        <asp:DropDownList ID="stateText1" runat="server" Width="403px">
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
                <tr>
                    <td>
                        <asp:Button ID="infoSubmit" runat="server" Text="Update" CssClass="btn-primary" OnClick="btnInfoSubmit" type="button" UseSubmitBehavior="False"/>
                    </td>
                    <td>
                        <asp:Button ID="menu1" runat="server" Text="Cancel" CssClass="btn-primary" OnClick="btnCancel" type="button" UseSubmitBehavior="False"/>
                    </td>
                </tr>
            </table>
        </div>

        <!--Udpate password-->
        <div id="userPassword" style="display: none" runat="server">
            <p style ="text-align:center"><b>Please update password below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 43%; text-align: left;">
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
                <tr>
                    <td>
                        <asp:Button ID="submitPassword" runat="server" Text="Update" CssClass="btn-primary" OnClick="btnSubmitPassword" type="button" UseSubmitBehavior="False"/>
                    </td>
                    <td>
                        <asp:Button ID="menu2" runat="server" Text="Cancel" CssClass="btn-primary" OnClick="btnCancel" type="button" UseSubmitBehavior="False"/>
                    </td>
                </tr>
            </table>
        </div>


        <!--Credit card-->
        <div id="userCreditCard" style="display: none" runat="server">
            <p style ="text-align:center"><b>Please select an option below below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 17%; text-align: center;">
                <tr style ="height: 30px">
                    <td style="width: 678px"><asp:Button ID="addCreditCard" runat="server" Text="Add A Credit Card" CssClass="btn-primary" OnClick="btnAddCreditCard" type="button" UseSubmitBehavior="False"/></td>
                    <td><asp:Button ID="menu3" runat="server" Text="Go Back" CssClass="btn-primary" OnClick="btnCancel"/></td>
                </tr>
            </table>

             <!-- Edit Credit Card-->
            <div id="editCC" style="display: block" runat="server">
                <table class="nav-justified" style = "margin: auto; width: 17%; text-align: center;">
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewCC" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="credit_CardID"
                                OnPageIndexChanging="OnPageIndexChanging" OnRowCancelingEdit="GridViewCC_RowCancelingEdit" OnRowDeleting="GridViewCC_RowDeleting" OnRowEditing="GridViewCC_RowEditing" OnRowUpdating="GridViewCC_RowUpdateing" Width="1000px">
                                <Columns>
                                    <asp:BoundField DataField ="cardNumber" HeaderText="Card Number" >
                                    <ControlStyle BackColor="#999999" />
                                    <HeaderStyle BackColor="#FF5959" Font-Bold="True" />
                                    <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="expDate" HeaderText="Exp Date" DataFormatString="{0:MM/yy}" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="bilingFullName" HeaderText="Name on Card" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="billingAddress" HeaderText="Address 1" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="billingAddress2" HeaderText="Address 2" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="billingCity" HeaderText="City" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="billingState" HeaderText="State" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField ="billingZipCode" HeaderText="ZipCode" >
                                    <HeaderStyle BackColor="#FF5959" />
                                    <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

         <!--Add Credit Card-->
        <div id="userAddCreditCard" style="display: none" runat="server">
            <p style ="text-align:center"><b>Please enter your credit card data below.</b></p> 
            <table class="nav-justified" style = "margin: auto; width: 33%; text-align: left;">
                <tr style ="height: 30px">
                    <td style="width:481px">Credit Card Number</td>
                    <td style="width: 533px"><asp:TextBox ID="CCNumber" runat="server" Width="403px"></asp:TextBox></td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:481px">Exp Date (MM/DD/YYYY)</td>
                    <!--<td style="width: 533px"><asp:TextBox ID="CCExp" runat="server" Width="403px"></asp:TextBox></td>-->
                    <td>
                        <asp:DropDownList ID="CCExpMonth" runat="server">
                            <asp:ListItem Value="01">Jan (01)</asp:ListItem>
                            <asp:ListItem Value="02">Feb (02)</asp:ListItem>
                            <asp:ListItem Value="03">Mar (03)</asp:ListItem>
                            <asp:ListItem Value="04">Apr (04)</asp:ListItem>
                            <asp:ListItem Value="05">May (05)</asp:ListItem>
                            <asp:ListItem Value="06">Jun (06)</asp:ListItem>
                            <asp:ListItem Value="07">Jul (07)</asp:ListItem>
                            <asp:ListItem Value="08">Aug (08)</asp:ListItem>
                            <asp:ListItem Value="09">Sep (09)</asp:ListItem>
                            <asp:ListItem Value="10">Oct (10)</asp:ListItem>
                            <asp:ListItem Value="11">Nov (11)</asp:ListItem>
                            <asp:ListItem Value="12">Dec (12)</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="CCExpYear" runat="server">
                            <asp:ListItem Value="22">22</asp:ListItem>
                            <asp:ListItem Value="23">23</asp:ListItem>
                            <asp:ListItem Value="24">24</asp:ListItem>
                            <asp:ListItem Value="25">25</asp:ListItem>
                            <asp:ListItem Value="26">26</asp:ListItem>
                            <asp:ListItem Value="27">27</asp:ListItem>
                            <asp:ListItem Value="28">28</asp:ListItem>
                            <asp:ListItem Value="29">29</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="31">31</asp:ListItem>
                            <asp:ListItem Value="32">32</asp:ListItem>
                            <asp:ListItem Value="33">33</asp:ListItem>
                            <asp:ListItem Value="34">34</asp:ListItem>
                            <asp:ListItem Value="35">35</asp:ListItem>
                            <asp:ListItem Value="36">36</asp:ListItem>
                            <asp:ListItem Value="37">37</asp:ListItem>
                            <asp:ListItem Value="38">38</asp:ListItem>
                            <asp:ListItem Value="39">39</asp:ListItem>
                            <asp:ListItem Value="40">40</asp:ListItem>
                            <asp:ListItem Value="41">41</asp:ListItem>
                            <asp:ListItem Value="42">42</asp:ListItem>
                            <asp:ListItem Value="43">43</asp:ListItem>
                            <asp:ListItem Value="44">44</asp:ListItem>
                            <asp:ListItem Value="45">45</asp:ListItem>
                        </asp:DropDownList>
                    </td>

                </tr>
                 <tr style ="height: 30px">
                    <td style="width:481px">Name On Card</td>
                    <td style="width: 533px"><asp:TextBox ID="CCName" runat="server" Width="403px"></asp:TextBox></td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:481px">Billing Address 1</td>
                    <td style="width: 533px"><asp:TextBox ID="CCAddres1" runat="server" Width="403px"></asp:TextBox></td>
                </tr>
                <tr style ="height: 30px">
                    <td style="width:481px">Billing Address 2</td>
                    <td style="width: 533px"><asp:TextBox ID="CCAddress2" runat="server" Width="403px"></asp:TextBox></td>
                </tr>  
                    <tr style ="height: 30px">
                    <td style="width:481px">Billing Zip Code</td>
                    <td style="width: 533px"><asp:TextBox ID="CCZip" runat="server" Width="403px"></asp:TextBox></td>
                </tr> 
                <tr style ="height: 30px">
                    <td style="width:481px">Billing City</td>
                    <td style="width: 533px"><asp:TextBox ID="CCCity" runat="server" Width="403px"></asp:TextBox></td>
                </tr> 
                <tr style ="height: 30px">
                    <td style="width:481px">Billing State</td>
                    <td>
                        <asp:DropDownList ID="ccState" runat="server" Width="403px">
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
                <tr>
                    <td></td>
                    <td>
                            <asp:Label ID="addCreditCardWarning" runat="server" Text="" CssClass="alert-warning"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="submitCC" runat="server" Text="Submit" CssClass="btn-primary" OnClick="btnAddSubmitCC" type="button" UseSubmitBehavior="False"/>
                    </td>
                    <td>
                        <asp:Button ID="cancelCC" runat="server" Text="Cancel" CssClass="btn-primary" OnClick="btnUserCreditCard" type="button" UseSubmitBehavior="False"/>
                    </td>
                </tr>
            </table>
        </div>

        
    </div>
</asp:Content>