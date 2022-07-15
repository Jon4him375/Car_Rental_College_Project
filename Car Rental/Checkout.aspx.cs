using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class Checkout : System.Web.UI.Page
    {
        
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public int customerID;
        public string TOTAL_PRICE;
        public string vehicle;
        public string storeID;
        public double totalPrice;
        public double totalPricePass;
        public DateTime dropoff1;
        public DateTime pickUP;
        public string dropOff = _Default.dropOffDate + " " + _Default.dropOffTime;
        public string pickup = _Default.pickupDate + " " + _Default.pickupTime;
        public static string reservationID;
        public static bool payedOnline;
        public string price;
        public string make;
        public string model;
        public static bool error;
        public string year;
        string fname;
        string lname;
        string phonenumber;
        string addressString;
        string address2String;
        string cityString;
        string stateString;
        string emailString;
        string zipcodeString;

        protected void Page_Load(object sender, EventArgs e)
        {
            storeID = "1";

            if (!string.IsNullOrEmpty(_Default.dropOffDate) && !string.IsNullOrEmpty(_Default.pickupDate))
                {
                    if (!IsPostBack)
                    {
                    //For testing purposes
                    

                    //get session from Vehicles page
                    vehicle = (string)Session["vehicleID"];
                    //get customerID from session
                    customerID = (int)Session["customerID"];
                    SqlDataSource1.SelectParameters.Add("customer_ID", customerID.ToString());
                    SqlDataSource1.SelectCommand = "Select cardNumber From Credit_Card where customer_ID=@customer_ID";
                    price = (string)Session["dayPrice"];
                    totalPriceText.Text = price;
                    pickupDate.Text = _Default.pickupDate;
                    pickupTime.Text = _Default.pickupTime;
                    dropOffDate.Text = _Default.dropOffDate;
                    dropOffTime.Text = _Default.dropOffTime;

                    using (SqlConnection con = new SqlConnection(cs))
                    {

                        using (SqlCommand cmd = new SqlCommand("SELECT * From Customer where customer_ID =@customer_ID"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@customer_ID", customerID.ToString());
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                firstName.Text = sdr["firstName"].ToString();
                                lastName.Text = sdr["lastName"].ToString();
                                phone.Text = sdr["phoneNumber"].ToString();
                                address.Text = sdr["address"].ToString();
                                address2.Text = sdr["address2"].ToString();
                                city.Text = sdr["city"].ToString();
                                stateDropDown.Text = sdr["state"].ToString();
                                email.Text = sdr["email"].ToString();
                                zipCode.Text = sdr["zipCode"].ToString();
                            }
                            con.Close();
                        }
                        using (SqlCommand cmd = new SqlCommand("SELECT * From Vehicles where vehicleID =@vehicleID"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@vehicleID", vehicle);
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                string year = sdr["year"].ToString();
                                string make = sdr["make"].ToString();
                                string model = sdr["model"].ToString();

                                vehicleText.Text = year + " " + make + " " + model; 
                                
                            }
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand("SELECT * From Credit_Card where customer_ID =@customer_ID"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@customer_ID", customerID.ToString());
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                if (sdr.HasRows)
                                {
                                    creditCardDrop.Visible = true;
                                }

                            }
                            con.Close();
                        }


                    }


                    //get  totalPrice
                    totalPrice = (double)Session["totalPrice"];

                        totalPriceText.Text = totalPrice.ToString();

                }
                //if post back
                else
                {
                    //remove the style 'display: none' from div 'pay_online' 
                    //this allows the div to show when page is post backed
                    pay_online.Style["display"] = "block";
                }
                

            }
           
            //if dates are not selected on the home page, go to home page
            else
            {
                error = true;
                Response.Redirect("Default.aspx");
            }
            
        }
            
        
        
        protected void payNowChk_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Validate user data//

            //Generate an empty error message, we can add errors to this msg//
            string errorMessage = "";
            //Phone number string, will be used for validation//
            string phoneString = phone.Text;

            //Check first and last name//
            if (string.IsNullOrEmpty(firstName.Text))
                errorMessage += "<br>Please enter a first name.";
            if (string.IsNullOrEmpty(lastName.Text))
                errorMessage += "<br>Please enter a last name.";

            //Check Phone//
            if (string.IsNullOrEmpty(phone.Text))
                errorMessage += "<br>Please enter a phone number.";
            else//Verify if user entered a vaild phone number/format//
            {
                //Remove -'s and () if entered
                phoneString = phoneString.Replace("-", "");
                phoneString = phoneString.Replace("(", "");
                phoneString = phoneString.Replace(")", "");
                if (phoneString.Length == 10)
                {
                    //Force phone number entered to follow the number format of 1(222)-333-4444//
                    phoneString = "1" + phoneString;
                }
                else if (phoneString.Length == 11)
                {
                    //Check if the number givin is all digits//
                    if (!phoneString.All(char.IsDigit))
                    {
                        errorMessage += "<br>Please enter a vaild phone number";
                    }
                    else
                    {
                        //convert phone number to format 1(222)-333-4444//
                        phoneString = phoneString.Insert(1, "(");
                        phoneString = phoneString.Insert(5, ")-");
                        phoneString = phoneString.Insert(10, "-");
                    }
                }
                else
                {//if Phone number doesn't contain a area code or is too long//
                    errorMessage += "<br>Please enter a vaild phone number using an area code.";
                }
            }

            //Check email//
            if (string.IsNullOrEmpty(email.Text))
                errorMessage += "<br>Please enter an valid email address.";
            else //Check email format
            {
                //Check for valid email format
                Regex emailRegex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match emailMatch = emailRegex.Match(email.Text);
                if (!emailMatch.Success)
                    errorMessage += "<br>Please enter a valid Email address";
            }

            //Check others//
            if (string.IsNullOrEmpty(address.Text))
                errorMessage += "<br>Please enter an address.";
            if (string.IsNullOrEmpty(city.Text))
                errorMessage += "<br>Please enter a city.";
            if (string.IsNullOrEmpty(zipCode.Text))
                errorMessage += "<br>Please enter a zip code.";

            //Check card data//
            if (payNowChk.Checked == true)
            {
                //Validate credit card number//
                string creditcardString = cardNumber.Text;
                creditcardString = creditcardString.Trim();
                if (string.IsNullOrEmpty(cardNumber.Text))
                    errorMessage += "<br>Please enter a valid credit card number.";
                else //Check length of card number
                {
                    //remove any -'
                    creditcardString = creditcardString.Replace("-", "");
                    if (creditcardString.Length != 16)
                    {
                        errorMessage += "<br>Please enter a valid credit card number";
                    }
                }

                if (string.IsNullOrEmpty(expDate.Text))
                    errorMessage += "<br>Please enter a valid experation date.";

                //check CVC//
                if (string.IsNullOrEmpty(cvc.Text))
                    errorMessage += "<br>Please enter a valid CVC number.";
                else //Check cvc length
                {
                    string cvcString = cvc.Text;
                    cvcString = cvcString.Trim();
                    if (cvcString.Length != 3)
                        errorMessage += "<br>Please enter a valid CVC number.";
                }

                //Check Address//
                if (string.IsNullOrEmpty(billingAddress.Text))
                    errorMessage += "<br>Please enter a billing address";
                if (string.IsNullOrEmpty(billingZip.Text))
                    errorMessage += "<br>Please enter a vaild zip code to the credit card zip code field.";
                if (string.IsNullOrEmpty(billingName.Text))
                    errorMessage += "<br>Please enter the name on your credit card in the billing name field.";
                if (string.IsNullOrEmpty(billingCity.Text))
                    errorMessage += "<br>Please enter a city to the credit card city field.";
            }
            //sql connection, command, and data reader
            using (SqlConnection con = new SqlConnection(cs))
            {
                //get session id from log in page
                customerID = (int)Session["customerID"];
                using (SqlCommand cmd = new SqlCommand("SELECT * From Customer where customer_ID =@customer_ID"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@customer_ID", customerID.ToString());
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        //read query and set textboxes via sql command statement 
                        sdr.Read();
                        fname = sdr["firstName"].ToString();
                        lname = sdr["lastName"].ToString();
                        phonenumber = sdr["phoneNumber"].ToString();
                        addressString = sdr["address"].ToString();
                        address2String = sdr["address2"].ToString();
                        cityString = sdr["city"].ToString();
                        stateString = sdr["state"].ToString();
                        emailString = sdr["email"].ToString();
                        zipcodeString = sdr["zipCode"].ToString();


                    }
                    con.Close();
                }
            }

            //If we have errors, tell user//
            if (errorMessage != "")
            {
                validationErrorLabel.Text = errorMessage;
                //If data is validated, add data to database
            }else if (firstName.Text != fname || lastName.Text != lname || phone.Text != phonenumber || address.Text != addressString ||
                        address2.Text != address2String || city.Text != cityString || stateDropDown.Text != stateString || email.Text != emailString ||
                        zipCode.Text != zipcodeString)
            {
                editCustomerInfo.Visible = true;
            }
            
            else
            {
                //hide error message
                editCustomerInfo.Visible = false;
                //get session for vehciles from 'view vehicles'
                vehicle = (string)Session["vehicleID"];
                //get session from log in 
                customerID = (int)Session["customerID"];
                using (con = new SqlConnection(cs))
                {

                    con.Open();
                    string dropOff = dropOffDate.Text + " " + dropOffTime.Text;
                    string pickup = pickupDate.Text + " " + pickupTime.Text;

                    //stored proc to check if the dates that were changed has a res already or not
                    using (SqlCommand cmd = new SqlCommand("SP_Find_Dates_With_Vehicle", con))
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pickupDate", pickup);
                        cmd.Parameters.AddWithValue("@dropOffDate", dropOff);
                        cmd.Parameters.AddWithValue("@vehicleID", vehicle);
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            //if dates that were changed has reservation already, show error
                            if (sdr.HasRows)
                            {
                                errorLabel.Visible = true;
                                sdr.Close();
                            }

                        }
                    }

                    con.Close();
                    double totalprice = (double)Session["totalPrice"];
                    
                    errorLabel.Visible = false;
                    // uses sql Stored Procedure for query
                    // query uses all of these values to insert
                    totalPriceText.Text = Regex.Replace(totalPriceText.Text, "[^0-9.]", "");
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("SP_Insert_Reservation", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@customerID", customerID);
                    cmd2.Parameters.AddWithValue("@vehicleID", vehicle);
                    cmd2.Parameters.AddWithValue("@storeID", storeID);
                    cmd2.Parameters.AddWithValue("@pickupDate", pickup);
                    cmd2.Parameters.AddWithValue("@dropOffDate", dropOff);
                    cmd2.Parameters.AddWithValue("@pickupTime", pickupTime.Text);
                    cmd2.Parameters.AddWithValue("@dropOffTime", dropOffTime.Text);
                    cmd2.Parameters.AddWithValue("@totalPrice", totalprice);
                    cmd2.Parameters.AddWithValue("@carNumberUsed", cardNumber.Text);

                    cmd2.ExecuteNonQuery();
                    con.Close();
                    //get the last reservation id to pass to order conformation page
                    using (SqlCommand cmd4 = new SqlCommand("SELECT TOP 1 * FROM Reservation ORDER BY reservationID DESC", con))
                    {
                        con.Open();
                        using (SqlDataReader dr = cmd4.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    reservationID = dr["reservationID"].ToString();
                                }



                            }
                            dr.Close();
                            con.Close();
                        }
                    }

                    //if check box 'Pay Now' is checked
                    if (payNowChk.Checked == true)
                    {
                        using (SqlCommand cmd4 = new SqlCommand("SELECT  * FROM Credit_Card where cardNumber= @cardNumber", con))
                        {
                            cmd4.Parameters.AddWithValue("@cardNumber", cardNumber.Text);
                            con.Open();
                            using (SqlDataReader dr = cmd4.ExecuteReader())
                            {
                                if (dr.HasRows)
                                {
                                    while (dr.Read())
                                    {
                                        
                                    }
                                }
                                else
                                {

                                    //add credit card info
                                    payedOnline = true;
                                    customerID = (int)Session["customerID"];
                                                                        
                                    SqlCommand cmd3 = new SqlCommand("SP_Insert_Credit_Card", con);
                                    cmd3.CommandType = CommandType.StoredProcedure;
                                    cmd3.Parameters.AddWithValue("@cardNumber", cardNumber.Text);
                                    cmd3.Parameters.AddWithValue("@expDate", expDate.Text);
                                    cmd3.Parameters.AddWithValue("@billingAddress", billingAddress.Text);
                                    cmd3.Parameters.AddWithValue("@billingAddress2", billingAddress2.Text);
                                    cmd3.Parameters.AddWithValue("@billingState", billingState.Text);
                                    cmd3.Parameters.AddWithValue("@billingCity", billingCity.Text);
                                    cmd3.Parameters.AddWithValue("@billingZipCode", billingZip.Text);
                                    cmd3.Parameters.AddWithValue("@billingFullName", billingName.Text);
                                    cmd3.Parameters.AddWithValue("@customer_ID", customerID);
                                    dr.Close();
                                    cmd3.ExecuteNonQuery();
                                }
                               
                                
                            }
                        }
                        
                        con.Close();
                    }
                    else
                    {
                        payedOnline = false;
                    }


                    using (SqlCommand cmd4 = new SqlCommand("SELECT * from Vehicles where vehicleID = @vehicleID", con))
                    {

                        cmd4.Parameters.AddWithValue("@vehicleID", vehicle);
                        con.Open();
                        using (SqlDataReader dr = cmd4.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    year = dr["year"].ToString();
                                    make = dr["make"].ToString();
                                    model = dr["model"].ToString();
                                }



                            }
                            dr.Close();
                            con.Close();
                        }
                    }

                    _Default.dropOffDate = null;
                    _Default.dropOffTime = null;
                    _Default.pickupDate = null;
                    _Default.pickupTime = null;

                    //save session info to pass to email and order conformation
                    Session["reservationID"] = reservationID;
                    Session["cardNumber"] = cardNumber.Text;

                    //email info
                    string toEmail = email.Text;
                    string EmailSubj = "Reservation Conformation";
                    string EmailMsg = "<h2>Thank Your For Reserving a Vehicle</h2>" +
                        "</br>" +

                    "Reservation Number: " + reservationID + "<br>" +
                    "Reservtion Contact Name: " + firstName.Text + " " + lastName.Text + "<br>" +
                    "Phone Number: " + phoneString + "<br>" +
                    "Vehicle Reserved: " + year + " " + make + " " + model + "<br>" +
                    "Dates Reserved: " + dropOff + " - " + pickup + "<br>" +
                    "Total Price :" + totalprice;

                    //call Email method 
                    Email(toEmail, EmailSubj, EmailMsg);
                    //redirect to order conformation page
                    Response.Redirect("ReservationConformation.aspx");


                }


            }
        }


        public static void Email(string ToEmail, string Subj, string Message)
        {
            //get 'FromMail', 'Password', 'Host' from web.config file
            string FromEmailID = ConfigurationManager.AppSettings["FromMail"].ToString();
            string Pass = ConfigurationManager.AppSettings["Password"].ToString();
            string host = ConfigurationManager.AppSettings["Host"].ToString();

            MailMessage mailMesssage = new MailMessage();

            //setting the email information
            mailMesssage.From = new MailAddress(FromEmailID);
            mailMesssage.Subject = Subj;
            mailMesssage.Body = Message;
            mailMesssage.IsBodyHtml = true;
            mailMesssage.To.Add(new MailAddress(ToEmail));

            SmtpClient smtp = new SmtpClient(host, 587);

            smtp.UseDefaultCredentials = false;
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(FromEmailID, Pass);
            smtp.Credentials = credentials;
            smtp.EnableSsl = true;
            smtp.Send(mailMesssage);
        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dropOffDate_TextChanged(object sender, EventArgs e)
        {
         
        }


        //when creditCarDrop down list is select.....
        protected void creditCardDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                // get all info from Credit_Card table where cardNumber = @cardNumber
                using (SqlCommand cmd = new SqlCommand("SELECT * From Credit_Card where cardNumber =@cardNumber"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cardNumber", creditCardDrop.SelectedValue);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();

                        //set textboxes via sql query
                        if (sdr.HasRows)
                        {
                            creditCardDrop.Visible = true;
                            cardNumber.Text = sdr["cardNumber"].ToString();
                            expDate.Text = sdr["expDate"].ToString();
                            billingAddress.Text = sdr["billingAddress"].ToString();
                            billingAddress2.Text = sdr["billingAddress2"].ToString();
                            billingState.Text = sdr["billingState"].ToString();
                            billingZip.Text = sdr["billingZipCode"].ToString();
                            billingName.Text = sdr["bilingFullName"].ToString();
                            billingCity.Text = sdr["billingCity"].ToString();
                        }

                    }
                    con.Close();
                }
            }
        }

        protected void creditCardDrop_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void creditCardDrop_Load(object sender, EventArgs e)
        {
            
        }
    }
    }
