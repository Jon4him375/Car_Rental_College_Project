using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class SiteMaster : MasterPage
    {
        public string userRole;
        public string loggedIN;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["email"] == null)
                {
                    /*If not logged in
                     * Show login and registration links
                     * Don't show logout link and user name*/
                    Registration.Attributes["Style"] = "color: white; display:block;";
                    Login.Attributes["Style"] = "color: white; display:block;";

                    userFirstName.Attributes["Style"] = "color: white; display:none;";
                    userFirstName.InnerText = "";
                }
                else
                {
                    /*If logged in
                     * Show logout link and user name
                     * Don't show login and registration links*/
                    Registration.Attributes["Style"] = "color: white; display:none;";
                    Login.Attributes["Style"] = "color: white; display:none;";

                    userFirstName.Attributes["Style"] = "color: white; display:block;";
                    userFirstName.InnerText = "Welcome " + Session["userName"].ToString()+"!";

                }

                loggedIN = (string)Session["loggedIn"];
                userRole = (string)Session["userRole"];

                if(loggedIN == "True")
                {
                    dropDownButton.Visible = true;
                }
                else
                {
                    dropDownButton.Visible = false ;
                }
                if(userRole == "Admin")
                {
                    adminLi.Visible = true;
                }
                else
                {
                    adminLi.Visible = false;
                    
                }

                
                if(ViewVehicle.wasClickedFromView == true)
                {
                    checkout.Visible = true;
                }
               
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
      
    }
}