using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography;
using System.IO;

namespace Car_Rental
{
    public partial class Registration : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string password="";


        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Submit_Click1(object sender, EventArgs e)
        {
            //Store phoneNumber string here//
            //Will be used for checks & database insert//
            string phoneString = phoneNumberText.Text;
            //Check User Data//
            string errorMessage = "";

            if (string.IsNullOrEmpty(firstNameText.Text))
            {
                errorMessage += "<br>First name is required.";
            }
            if (string.IsNullOrEmpty(lastNameText.Text))
            {
                errorMessage += "<br>Last name is required.";
            }
            if (string.IsNullOrEmpty(phoneNumberText.Text))
            {
                errorMessage += "<br>Phone number is required.";
            }
            else //Check if valid phone number//
            {
                //Remove -'s & () if entered (for checks)
                phoneString=phoneString.Replace("-", "");
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
            if (string.IsNullOrEmpty(driverLicenseNumberText.Text))
            {
                errorMessage += "<br>Driver License Number is required.";
            }

            //Check for errors//
            //If errors, report them back to user//
            //Else finish up registration//
            if (errorMessage != "")
                userDataError.Text = errorMessage;
            else
            {
                password = HiddenField1.Value;
                //Hash password//
                Scripts.HashPassword hashPassword = new Scripts.HashPassword();
                string hashedPassword = hashPassword.HashPwd(password.Trim());

                //Add user data/account data to DB//
                using (con = new SqlConnection(cs))
                {
                    //uses sql Stored Procedure for query
                    //query uses all of these values to insert

                    //Create account/Customer//
                    con.Open();
                    cmd = new SqlCommand("SP_Insert_AccountAndCustomer", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userName", HiddenEmail.Value.Trim());
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.Parameters.AddWithValue("@userRole", "customer");
                    cmd.Parameters.AddWithValue("@firstName", firstNameText.Text);
                    cmd.Parameters.AddWithValue("@lastName", lastNameText.Text);
                    cmd.Parameters.AddWithValue("@phoneNumber", phoneString);
                    cmd.Parameters.AddWithValue("@address", address1Text.Text);
                    cmd.Parameters.AddWithValue("@address2", address2Text.Text);
                    cmd.Parameters.AddWithValue("@zipCode", zipCodeText.Text);
                    cmd.Parameters.AddWithValue("@state", stateDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@city", cityText.Text);
                    cmd.Parameters.AddWithValue("driverLicensesNumber", driverLicenseNumberText.Text);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    string toEmail = emailText.Text;
                    string EmailSubj = "Moraine Park Car Rentals Account Created"; 
                    string EmailMsg = "<h1>New Account Created</h1>" + "<br>" +
                        "You have created an account with Moraine Park Car Rentals " + "<br>" +
                        "Username: " + emailText.Text;

                    Email(toEmail, EmailSubj, EmailMsg);

                    /*string filePath = @"C:\Users\12628\Documents\GitHub\Car_Rental_Moraine_Park\Car Rental\CustomersFile.txt";                    
                    List<string> lines = new List<string>();
                    lines = File.ReadAllLines(filePath).ToList();
                    lines.Add(emailText.Text + ", " + firstNameText.Text + ", " + lastNameText.Text + ", " +
                        phoneNumberText.Text + ", " + address1Text.Text + ", " + address2Text.Text + ", " + cityText.Text + ", " + stateDropDown.Text + ", " + zipCodeText.Text + ", " + driverLicenseNumberText.Text);
                    File.WriteAllLines(filePath, lines);*/
                }
                customerInfo.Attributes["style"] = "display: none";
                confrimDiv.Attributes["style"] = "display: block";
            }
        }

        protected void Continue_Click(object sender, EventArgs e)
        {

            string errorMessage = "";
            //Validate Email Address//
            if (string.IsNullOrEmpty(emailText.Text)) //Check if anything was inputted
                errorMessage += "<br>Email address is required.";
            else
            {
                //Check for valid email format
                Regex emailRegex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match emailMatch = emailRegex.Match(emailText.Text);
                if (!emailMatch.Success)
                    errorMessage += "<br>Please enter a vaild Email address";
                else //make sure email isn't in DB already
                {
                    using(con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand("Select * from Account where userName =@email", con);
                        cmd2.Parameters.AddWithValue("@email", emailText.Text);
                        using(SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                errorMessage += "<br>This email is already registred!";
                            }
                            reader.Close();
                        }
                        con.Close();
                    }

                }

            }

            //Validate Passwords//
            if (string.IsNullOrEmpty(passwordText1.Text) || string.IsNullOrEmpty(passwordText2.Text)) //Check to make sure something was put in both password fields
                errorMessage += "<br>Password is required.";
            else
            {
                password = passwordText1.Text;
                HiddenField1.Value =password;

                if (passwordText1.Text != passwordText2.Text) //Check if password fields are the same
                    errorMessage += "<br>Passwords do not match.";
                else
                {
                    //Check if password follows password rules
                    Regex passwordRegex = new Regex(@"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$");
                    Match passwordMatch = passwordRegex.Match(passwordText1.Text);
                    if (!passwordMatch.Success)
                        errorMessage += "<br>Please enter a valid password." +
                            "<br>Passwords must contain at least..." +
                            "<br>One upper case letter" +
                            "<br>One lower case letter" +
                            "<br>One digit" +
                            "<br>one special character(!@#$%^&*-)";
                }
            }

            //if no errors, continue to customer information, otherwise display error
            if (errorMessage == "")
            {
                HiddenEmail.Value = emailText.Text;
                accountCreation.Attributes["style"] = "display: none";
                customerInfo.Attributes["style"] = "display: block";
            }
            else
               ErrorMsg.Text = errorMessage;

         
        }

        protected void Previous_Click(object sender, EventArgs e)
        {
            accountCreation.Attributes["style"] = "display: block";
            customerInfo.Attributes["style"] = "display: none";
        }

        public static void Email(string ToEmail, string Subj, string Message)
        {

            string FromEmailID = ConfigurationManager.AppSettings["FromMail"].ToString();
            string Pass = ConfigurationManager.AppSettings["Password"].ToString();
            string host = ConfigurationManager.AppSettings["Host"].ToString();

            MailMessage mailMesssage = new MailMessage();

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

        
    }
}