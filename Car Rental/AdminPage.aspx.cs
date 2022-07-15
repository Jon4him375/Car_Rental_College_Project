using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class AdminPage : Page
    {
        
        public string userRole;
        protected void Page_Load(object sender, EventArgs e)
        {
            //get userRole session from login page
            userRole = (string)Session["userRole"];

            {
                //if a user is not logged in or their role is not an admin go back to the home page
                if (Login.loggedin == false || userRole != "Admin")
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Categories.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Vehicles.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Categories.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("customerReport.aspx");
        }
    }
}
