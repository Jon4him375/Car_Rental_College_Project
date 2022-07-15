using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class Categoryaspx : System.Web.UI.Page
    {

        //need static variables to pass from page to page
        public static bool reserveButtonClicked;
        public static string id_access;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("category");
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LnkClicked(Object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
          
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            //saves 'Label1' to session 
            // Label1 is CategoriesName
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label name = (Label)item.FindControl("Label1");
            string test = name.Text;
           

            id_access = btn.CommandArgument;
            reserveButtonClicked = true;
            Session["category"] = test;
            Response.Redirect("Vehicles.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }

    

    
    }

