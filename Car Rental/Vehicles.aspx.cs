using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class Products : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public static bool reserveButtonClicked;
        public static string id_access;
        public static string price;
        public string category;


        protected void Page_Load(object sender, EventArgs e)
        {
            //get session from category page
            //if category is null , show all vehicles or show vehicles in category
             category = (string)Session["category"];

            string vehicleID;
            //check first if any of the textboxes on the home page have values
            if (!string.IsNullOrEmpty(_Default.pickupDate) && !string.IsNullOrEmpty(_Default.dropOffDate) && !string.IsNullOrEmpty(_Default.pickupTime) && !string.IsNullOrEmpty(_Default.dropOffTime) && !string.IsNullOrEmpty(category))
            {
                
                using (con = new SqlConnection(cs))
                {
                    string dropOff = _Default.dropOffDate + " " + _Default.dropOffTime;
                    string pickup = _Default.pickupDate + " " + _Default.pickupTime;

                    List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
                    Dictionary<string, string> column;

                    SqlCommand command = new SqlCommand("SP_Select_Avaliable_Vehicles_With_Category", con);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@pickupDate", pickup);
                    command.Parameters.AddWithValue("@dropOffDate", dropOff);                   
                    command.Parameters.AddWithValue("@CategoriesName", category);
                    con.Open();
                    string query = "Select * From Vehicles where(CategoriesName = @CategoriesName)";
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        int i = 0;
                        while (reader.Read())
                        {
                            
                            i++;
                            string vehiclecount = i.ToString();
                            vehicleID = reader.GetValue(0).ToString();                            
                            
                            query += " AND vehicleID !=@vehicleID" +vehiclecount;
                            
                          SqlDataSource2.SelectParameters.Add("vehicleID" + vehiclecount, vehicleID);
                            
                        }
                        reader.Close();
                        SqlDataSource2.SelectParameters.Add("CategoriesName", category);
                        SqlDataSource2.SelectCommand = query;
                        
                        con.Close();

                    }

                }

            }
        
            //if not see if there is a value in categories from categories page
            else if (!string.IsNullOrEmpty(category))
            { 
                //add select command to datasource which will change the data list 
                SqlDataSource2.SelectParameters.Add("CategoriesName", category);
                SqlDataSource2.SelectCommand = "Select * From Vehicles where (CategoriesName = @CategoriesName) ";

            }
            //if not show all vehicles 
            else
            {
                //select command to change datasource 
                SqlDataSource2.SelectCommand = ("Select * From Vehicles");
            }
            //remove category id once the page is finshed loading so when you click on the vehicles tab without
            //coming from categories page it will show all vehicles 
            
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            //save vehicleID (which is not visible on screen) as a session \
            //pass info to ViewVehicles
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label name = (Label)item.FindControl("Label2");
            string test = name.Text;

            category = "";
            Session.Remove("category");
            category = null;
            id_access = btn.CommandArgument;
            reserveButtonClicked = true;
            Session["vehicleID"] = test;
            
            Response.Redirect("ViewVehicle.aspx");


        }

       
    }
}
