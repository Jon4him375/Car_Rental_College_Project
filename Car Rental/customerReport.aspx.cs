using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class customerReport : System.Web.UI.Page
    {
        public static string customer_ID;
        public static string firstName;
        public static string lastName;
        public static string phoneNumber;
        public static string address;
        public static string zipCode;
        public static string state;
        public static string email;
        public static string driversLicenseNumber;
        public static string accountID;
        public static string credit_CardID;
      
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SearchCustomers();
            }
        }

        //method for searching for customers
        private void SearchCustomers()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM Customer";
                    if (!string.IsNullOrEmpty(fName.Text) && !string.IsNullOrEmpty(lName.Text))
                    {
                        sql += " WHERE firstName LIKE (@firstName +'%') AND lastName LIKE ( @lastName + '%')";
                        cmd.Parameters.AddWithValue("@firstName", fName.Text.Trim());
                        cmd.Parameters.AddWithValue("@lastName", lName.Text.Trim());

                    }
                    else if (!string.IsNullOrEmpty(lName.Text.Trim()))
                    {
                        sql += " WHERE lastName LIKE (@lastName + '%')";
                        cmd.Parameters.AddWithValue("@lastName", lName.Text.Trim());
                    }
                    else if (!string.IsNullOrEmpty(fName.Text.Trim()))
                    {
                        sql += " WHERE firstName LIKE (@firstName + '%')";
                        cmd.Parameters.AddWithValue("@firstName", fName.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SearchCustomers();
        }

        //sends information to customer billing page
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[index];
                customer_ID = row.Cells[0].Text;
                firstName = row.Cells[1].Text;
                lastName = row.Cells[2].Text;
                phoneNumber = row.Cells[3].Text;
                address = row.Cells[4].Text;
                zipCode = row.Cells[5].Text;
                state = row.Cells[6].Text;
                email = row.Cells[7].Text;
                driversLicenseNumber = row.Cells[8].Text;
                accountID = row.Cells[9].Text;
                credit_CardID = row.Cells[10].Text;
              

                Response.Redirect("customerBilling.aspx");
            }
           
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}

