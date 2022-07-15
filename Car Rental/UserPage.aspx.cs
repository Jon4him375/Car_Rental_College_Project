using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Linq;
using System.Data;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class UserPage : System.Web.UI.Page
    {
        string file = string.Empty;
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        string email, fName, lName, phone, address1, address2, city, state, zipcode, driverLicenseNumber;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Welcome msg//
                if (Session["email"] != null)
                    welcome.InnerText = "Welcome " + Session["userName"].ToString() + "!";
                else
                    Response.Redirect("Default.aspx");



                //Autofill user data//
                if (Session["email"] != null)
                {
                    if (fName == null)
                    {
                        using (con = new SqlConnection(cs))
                        {
                            //Get user data//
                            con.Open();
                            cmd = new SqlCommand
                                ("Select firstName, lastName, phoneNumber, address, zipCode," +
                                "state, email, driverLicenseNumber, address2, city" +
                                " from Customer where customer_ID =@customer_ID", con);
                            cmd.Parameters.AddWithValue("@customer_ID", Session["customerID"]);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                reader.Read();
                                fName = reader.GetString(0);
                                lName = reader.GetString(1);
                                phone = reader.GetString(2);
                                address1 = reader.GetString(3);
                                zipcode = reader.GetString(4);
                                state = reader.GetString(5);
                                email = reader.GetString(6);
                                driverLicenseNumber = reader.GetString(7);
                                address2 = reader.GetString(8);
                                city = reader.GetString(9);
                                reader.Close();
                            }
                            con.Close();

                            //Change phone number format//
                            phone = phone.Substring(0, 1) + "-" + phone.Substring(1, 3) + "-" + phone.Substring(4, 3) + "-" + phone.Substring(7);

                            //Fill in textboxes//
                            emailText.Text = email;
                            firstNameText.Text = fName;
                            lastNameText.Text = lName;
                            phoneNumberText.Text = phone;
                            address1Text.Text = address1;
                            address2Text.Text = address2;
                            cityText.Text = city;
                            stateText1.Text = state;
                            zipCodeText.Text = zipcode;
                            driverLicenseNumberText.Text = driverLicenseNumber;
                        }
                    }
                }
            }
        }

        //Buttons that show/hide fields//
        protected void btnUserInfo(object sender, EventArgs e)
        {
            userInfo.Attributes["style"] = "display: block";
            customerInfo.Attributes["style"] = "display: none";
        }
        protected void btnUserPass(object sender, EventArgs e)
        {
            userPassword.Attributes["style"] = "display: block";
            customerInfo.Attributes["style"] = "display: none";
        }
        protected void btnUserCreditCard(object sender, EventArgs e)
        {
            userCreditCard.Attributes["style"] = "display: block";
            customerInfo.Attributes["style"] = "display: none";
            userAddCreditCard.Attributes["style"] = "display:none";

            BindGridCC();
        }

        protected void btnAddCreditCard(object sender, EventArgs e)
        {
            userAddCreditCard.Attributes["style"] = "display:block";
            userCreditCard.Attributes["style"] = "display:none";
        }


        protected void btnCancel(object sender, EventArgs e)
        {
            userInfo.Attributes["style"] = "display: none";
            userPassword.Attributes["style"] = "display: none";
            userCreditCard.Attributes["style"] = "display: none";
            customerInfo.Attributes["style"] = "display: block";
            userAddCreditCard.Attributes["style"] = "display:none";
        }

        //Submit Buttons//
        protected void btnInfoSubmit(object sender, EventArgs e)
        {
            //Validate data//
            string errorMessage = "";
            string phoneString = phoneNumberText.Text;

            if (string.IsNullOrEmpty(emailText.Text)) //Check if anything was inputted
                errorMessage += "<br>Email address is required.";
            else
            {
                //Check if user changed email//
                if (emailText.Text.Trim() == Session["email"].ToString())
                {
                    //Do nothing
                }
                else
                {
                    //Check for valid email format//
                    Regex emailRegex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                    Match emailMatch = emailRegex.Match(emailText.Text);
                    if (!emailMatch.Success)
                        errorMessage += "<br>Please enter a vaild Email address";
                    else //make sure email isn't in DB already//
                    {
                        using (con = new SqlConnection(cs))
                        {
                            con.Open();
                            SqlCommand cmd2 = new SqlCommand("Select * from Account where userName =@email", con);
                            cmd2.Parameters.AddWithValue("@email", emailText.Text);
                            using (SqlDataReader reader = cmd2.ExecuteReader())
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
            }
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
            if (string.IsNullOrEmpty(driverLicenseNumberText.Text))
            {
                errorMessage += "<br>Driver License Number is required.";
            }

            //Output Error to user//
            if (errorMessage != "")
            {
                userDataError.Text = errorMessage;
            }

            //Query stuff goes here//
            else
            {
                using (con = new SqlConnection(cs))
                {
                    //Update Email//
                    if (emailText.Text.Trim() != Session["email"].ToString())
                    {
                        con.Open();
                        //Update account table//
                        cmd = new SqlCommand("UPDATE Account SET userName =@email WHERE userName =@oldEmail", con);
                        cmd.Parameters.AddWithValue("@email", emailText.Text.Trim());
                        cmd.Parameters.AddWithValue("@oldEmail", Session["email"].ToString());
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();

                        //Update customer table//
                        cmd = new SqlCommand("UPDATE Customer SET email =@email WHERE customer_ID =@customerID", con);
                        cmd.Parameters.AddWithValue("@email", emailText.Text.Trim());
                        cmd.Parameters.AddWithValue("@customerID", Session["customerID"].ToString());
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();

                        con.Close();
                    }

                    //Update Everything Else//
                    con.Open();
                    cmd = new SqlCommand("UPDATE Customer " +
                        "SET firstName =@fn, lastName = @ln, phoneNumber = @pn, address = @ad1, " +
                        "zipCode=@zc, state=@state, driverLicenseNumber=@dln, address2 = @ad2, city = @city " +
                        "WHERE customer_ID = @customerID", con);
                    cmd.Parameters.AddWithValue("@fn", firstNameText.Text);
                    cmd.Parameters.AddWithValue("@ln", lastNameText.Text);
                    cmd.Parameters.AddWithValue("@pn", phoneString);
                    cmd.Parameters.AddWithValue("@ad1", address1Text.Text);
                    cmd.Parameters.AddWithValue("@zc", zipCodeText.Text);
                    cmd.Parameters.AddWithValue("@state", stateText1.Text);
                    cmd.Parameters.AddWithValue("@dln", driverLicenseNumberText.Text);
                    cmd.Parameters.AddWithValue("@ad2", address2Text.Text);
                    cmd.Parameters.AddWithValue("@city", cityText.Text);
                    cmd.Parameters.AddWithValue("@customerID", Session["customerID"].ToString());
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }

                //Return back to user page here//
                userInfo.Attributes["style"] = "display: none";
                customerInfo.Attributes["style"] = "display: block";
            }
        }
        protected void btnSubmitPassword(object sender, EventArgs e)
        {
            string errorMessage = "";
            string password = "";

            //Validate data//
            //Check to make sure something was put in both password fields//
            if (string.IsNullOrEmpty(passwordText1.Text) || string.IsNullOrEmpty(passwordText2.Text))
                errorMessage += "<br>Password is required.";
            else
            {
                password = passwordText1.Text;

                if (passwordText1.Text != passwordText2.Text) //Check if password fields are the same//
                    errorMessage += "<br>Passwords do not match.";
                else
                {
                    //Check if password follows password rules//
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
            if (errorMessage != "")
            {
                ErrorMsg.Text = errorMessage;
            }
            else
            {
                //Hash Password//
                Scripts.HashPassword hashPassword = new Scripts.HashPassword();
                string hashedPassword = hashPassword.HashPwd(password.Trim());
                //Query stuff goes here//
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Account SET password =@password WHERE userName =@email", con);
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }

                //Return back to user page here//
                userPassword.Attributes["style"] = "display: none";
                customerInfo.Attributes["style"] = "display: block";
            }
        }
        protected void btnAddSubmitCC(object sender, EventArgs e)
        {
            //Validate data//
            string errorMsg = "";

            string ccnum = CCNumber.Text.Trim();
            string ccexp = CCExpMonth.SelectedValue + "/01/" + CCExpYear.SelectedValue;
            if(string.IsNullOrEmpty(CCNumber.Text))
                errorMsg += "<br>Please enter a Credit Card Number";
            else
            {
                ccnum = ccnum.Replace("-", "");
                if (ccnum.Length == 16 && ccnum.All(char.IsDigit)) 
                {//Do nothing//
                }
                else
                    errorMsg += "<br>Please enter a valid Credit Card Number";
            }
            

            if (string.IsNullOrEmpty(CCName.Text))
                errorMsg += "<br>Please enter your full name as seen on your credit card.";
            if (string.IsNullOrEmpty(CCAddres1.Text))
                errorMsg += "<br>Please enter your billing address.";
            if (string.IsNullOrEmpty(CCZip.Text))
                errorMsg += "<br>Please enter a zip code.";
            if (string.IsNullOrEmpty(CCCity.Text))
                errorMsg += "<br>Please enter a city.";

            //Return errors to user//
            if (errorMsg != "")
            {
                addCreditCardWarning.Text = errorMsg;
            }
            //If no errors
            else
            {
                //Query stuff goes here//
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("INSERT INTO CREDIT_CARD(cardNumber, expDate, billingAddress, " +
                        "billingState, billingZipCode, bilingFullName, billingAddress2, customer_ID, billingCity, deleted) VALUES" +
                        "(@cardNumber, @expDate, @billingAddress, @billingState, @billingZipCode, @billingFullName, @billingAddress2, @customer_ID, @billingCity, 0)", con);
                    cmd.Parameters.AddWithValue("@cardNumber", ccnum);
                    cmd.Parameters.AddWithValue("@expDate", ccexp);
                    cmd.Parameters.AddWithValue("@billingAddress", CCAddres1.Text);
                    cmd.Parameters.AddWithValue("@billingState", ccState.SelectedValue);
                    cmd.Parameters.AddWithValue("@billingZipCode", CCZip.Text);
                    cmd.Parameters.AddWithValue("@billingFullName", CCName.Text);
                    cmd.Parameters.AddWithValue("@billingAddress2", CCAddress2.Text);
                    cmd.Parameters.AddWithValue("@customer_ID", Session["customerID"]);
                    cmd.Parameters.AddWithValue("@billingCity", CCCity.Text);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();

                    BindGridCC();
                    //Return back to credit card page here//
                    userCreditCard.Attributes["style"] = "display: block";
                    userAddCreditCard.Attributes["style"] = "display:none";
                }
            }
        }

        //Credit Card GridView Stuff//
        private void BindGridCC()
        {
            //Fill DataFields//
            using (con = new SqlConnection(cs))
            {
                using (cmd = new SqlCommand("SELECT * " +
                                            "FROM Credit_Card " +
                                            "WHERE customer_ID=" + Session["customerID"].ToString()+
                                            " AND deleted =0"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridViewCC.DataSource = dt;
                            GridViewCC.DataBind();
                        }
                    }
                }
            }
        }

        //Edit Credit Card Data//
        protected void GridViewCC_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Allows user to edit their credit card info//
            GridViewCC.EditIndex = e.NewEditIndex;
            BindGridCC();
        }
        protected void GridViewCC_RowUpdateing(object sender, GridViewUpdateEventArgs e)
        {
            int cardID = Convert.ToInt32(GridViewCC.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridViewCC.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("lblID");
            TextBox gvNumber = (TextBox)row.Cells[0].Controls[0];
            TextBox gvExp = (TextBox)row.Cells[1].Controls[0];
            TextBox gvName = (TextBox)row.Cells[2].Controls[0];
            TextBox gvAddress1 = (TextBox)row.Cells[3].Controls[0];
            TextBox gvAddress2 = (TextBox)row.Cells[4].Controls[0];
            TextBox gvCity = (TextBox)row.Cells[5].Controls[0];
            TextBox gvState = (TextBox)row.Cells[6].Controls[0];
            TextBox gvZip = (TextBox)row.Cells[7].Controls[0];
            GridViewCC.EditIndex = -1;
            using (con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Credit_Card " +
                    "SET cardNumber='" + gvNumber.Text + "', expDate='" + gvExp.Text + "', BilingFullName='" + gvName.Text + "', billingAddress='" + gvAddress1.Text
                    + "', billingAddress2='" + gvAddress2.Text + "', billingCity='" + gvCity.Text + "', billingState='" + gvState.Text + "', billingZipCode='" + gvZip.Text
                    + "' WHERE credit_CardID = '" + cardID.ToString()+"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGridCC();

            }
        }


        protected void GridViewCC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCC.EditIndex = -1;
            BindGridCC();
        }
        //Hide Credit Card Data from user ("Deleted")//
        protected void GridViewCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Hides CC from datafields//
            GridViewRow row = (GridViewRow) GridViewCC.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand(
                    "UPDATE Credit_Card " +
                    "SET deleted = 1 " +
                    "WHERE credit_CardID='" + Convert.ToInt32(GridViewCC.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGridCC();
            }
        }

        //Allow Paging//
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCC.PageIndex = e.NewPageIndex;
            this.BindGridCC();
        }
    }
}