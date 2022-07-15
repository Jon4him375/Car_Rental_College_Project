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
    public partial class UpdateVehiclesForm : System.Web.UI.Page
    {
        
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string file = string.Empty;
        public string vehicleID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if static varible from Edit_Vehicles are not empty...

                vehicleID = Edit_Vehicles.vehicleID;
                if (!string.IsNullOrEmpty(Edit_Vehicles.make))
                {
                    make.Text = Edit_Vehicles.make;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.model))
                {
                    model.Text = Edit_Vehicles.model;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.year))
                {
                    year.Text = Edit_Vehicles.year;
                }

                if (!string.IsNullOrEmpty(Edit_Vehicles.color))
                {
                    color.Text = Edit_Vehicles.color;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.CategoriesName))
                {
                    category.Text = Edit_Vehicles.CategoriesName;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.license_plate))
                {
                    licensePlate.Text = Edit_Vehicles.license_plate;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.price))
                {
                    price.Text = Edit_Vehicles.price;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.transmission))
                {
                    transmission.Text = Edit_Vehicles.transmission;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.mpg))
                {
                    mpg.Text = Edit_Vehicles.mpg;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.doors))
                {
                    doors.Text = Edit_Vehicles.doors;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.luggage))
                {
                    luggage.Text = Edit_Vehicles.luggage;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.description))
                {
                    description.Text = Edit_Vehicles.description;
                }
                if (!string.IsNullOrEmpty(Edit_Vehicles.vinNumber))
                {
                    vin.Text = Edit_Vehicles.vinNumber;
                }

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (image.HasFile)
            {
                //get file path
                image.SaveAs(Server.MapPath("~/Images/" + image.FileName));
                file = "~/Images/" + image.FileName;
            }
            
            using (con = new SqlConnection(cs))
            {
                //uses sql Stored Procedure for query
                //query uses all of these values to insert
                con.Open();
                cmd = new SqlCommand("SP__Vehicle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@make", make.Text);
                cmd.Parameters.AddWithValue("@vehicleID", Edit_Vehicles.vehicleID);
                cmd.Parameters.AddWithValue("@model", model.Text);
                cmd.Parameters.AddWithValue("@vinNumber", vin.Text);
                cmd.Parameters.AddWithValue("@year", year.Text);
                cmd.Parameters.AddWithValue("@color", color.Text);
                cmd.Parameters.AddWithValue("@price", price.Text);
                cmd.Parameters.AddWithValue("@description", description.Text);
                cmd.Parameters.AddWithValue("@license_plate", licensePlate.Text);
                cmd.Parameters.AddWithValue("@CategoriesName", category.Text);
                cmd.Parameters.AddWithValue("@luggage", luggage.Text);
                cmd.Parameters.AddWithValue("@mpg", mpg.Text);
                cmd.Parameters.AddWithValue("@doors", doors.Text);
                cmd.Parameters.AddWithValue("@transmission", transmission.Text);
                var img = Edit_Vehicles.img;
                if (changeImg.Checked)
                    img = file;
                cmd.Parameters.AddWithValue("@img", img);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Edit_Vehicles.aspx");

            }
        }
           
    }
}
