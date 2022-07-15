using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Linq;

namespace Car_Rental
{
    public partial class Login : System.Web.UI.Page
    {
        public static bool loggedin;
        public static bool isAdmin;

        string file = string.Empty;
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = emailText.Text;
            string password = passwordText.Text;
            string errorMessage = "";

            //Check if email empty or is invalid format//
            if (string.IsNullOrEmpty(email))
                errorMessage += "<br> Please enter an Email address.";
            else
            {
                //Check for valid email format
                Regex emailRegex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match emailMatch = emailRegex.Match(emailText.Text);
                if (!emailMatch.Success)
                    errorMessage += "<br>Please enter an vaild Email address";
            }

            //Check if password is empty//
            if (string.IsNullOrEmpty(password))
                errorMessage += "<br> Please enter a password.";

            //Check login credentials, only if no error is present."
            if (errorMessage == "")
            {
                //Check username is in database//
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Select * from Account where userName =@email", con);
                    cmd.Parameters.AddWithValue("@email", email);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            errorMessage += "<br>The email or password is incorrect.";
                        }
                        reader.Close();
                    }
                    con.Close();
                }
                //Check Password
                if (errorMessage == "")
                {
                    using (con = new SqlConnection(cs))
                    {
                        //Hash password//
                        Scripts.HashPassword hashPassword = new Scripts.HashPassword();
                        string hashedPassword = hashPassword.HashPwd(password);

                        //Compare hashed passwords
                        con.Open();
                        cmd = new SqlCommand("Select password from Account where userName =@email", con);
                        cmd.Parameters.AddWithValue("@email", email);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            string dbPassword = reader.GetString(0);
                            if (hashedPassword != dbPassword)
                            {
                                errorMessage += "<br>The email or password is incorrect.";
                            }
                            reader.Close();
                        }
                        con.Close();
                    }
                }
            }


            //Output error msgs or login//
            if (errorMessage != "")
                ErrorMsg.Text = errorMessage;
            else
            {
                //user logs in//
                //We will grab the user's first name, customerID, email, and role and place them into the current session.//


                int accountID;
                int customerID;
                string userName;
                string userRole;
                //Get accountID and User's role//
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Select accountID, userRole from Account where userName =@email", con);
                    cmd.Parameters.AddWithValue("@email", email);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();
                        accountID = reader.GetInt32(0);
                        userRole = reader.GetString(1);
                        reader.Close();
                    }
                    //get user's name and customerID//
                    cmd = new SqlCommand("Select firstName, customer_ID from Customer where accountID =@accountID", con);
                    cmd.Parameters.AddWithValue("@accountID", accountID);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();
                        userName = reader.GetString(0);
                        customerID = reader.GetInt32(1);
                        reader.Close();
                    }
                    con.Close();
                    loggedin = true;

                    Session["loggedIn"] = "True";

                }
                //Save user's name, email, customerID, and role to session//
                Session["email"] = email;
                Session["userName"] = userName;
                Session["customerID"] = customerID;
                Session["userRole"] = userRole;
                if (ViewVehicle.leaveReservationPage == true)
                {
                    
                    Response.Redirect("Checkout.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
                if (userRole == "Admin")
                {

                    Session["userRole"] = "Admin";

                }


            }
        }

    }
}