using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //remove all sessions when a user logs out
            Session.Contents.RemoveAll();
            Response.Redirect("Default.aspx");
            Login.loggedin = false;

            ViewVehicle.wasClickedFromView = false;
        }
    }
}