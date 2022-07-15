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
    public partial class Edit_Vehicles : System.Web.UI.Page
    {
        //create public static vars to be passed to other pages
        public static string vehicleID;
        public static string make;
        public static string model;
        public static string year;
        public static string color;
        public static string license_plate;
        public static string CategoriesName;
        public static string price;
        public static string description;
        public static string luggage;
        public static string mpg;
        public static string doors;
        public static string transmission;
        public static string vinNumber;
        public static string img;
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SearchVehicles();
            }
        }

        private void SearchVehicles()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //create a string for sql statement. we will concat the rest depending on which textboxes are not empty
                    string sql = "SELECT * FROM Vehicles";

                    //check which textboxes are not empty, concat the remaing sql query depending on textboxes

                    if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrEmpty(TextBox2.Text))
                    {
                        sql += " WHERE make LIKE (@make +'%') AND model LIKE ( @model + '%')";
                        cmd.Parameters.AddWithValue("@make", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@model", TextBox2.Text.Trim());

                    }
                    else if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
                    {
                        sql += " WHERE model LIKE @model + '%'";
                        cmd.Parameters.AddWithValue("@model", TextBox2.Text.Trim());
                    }
                    else if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                    {
                        sql += " WHERE make LIKE @make + '%'";
                        cmd.Parameters.AddWithValue("@make", TextBox1.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SearchVehicles();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if column 'Edit' is cliked
            if (e.CommandName == "Edit")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                //pass row variables from grid
                GridViewRow row = GridView1.Rows[index];
                vehicleID = row.Cells[0].Text;
                make = row.Cells[1].Text;
                model = row.Cells[2].Text;
                year = row.Cells[3].Text;
                color = row.Cells[4].Text;
                vinNumber = row.Cells[5].Text;
                license_plate = row.Cells[6].Text;
                CategoriesName = row.Cells[7].Text;
                price = row.Cells[8].Text;
                description = row.Cells[9].Text;
                luggage = row.Cells[10].Text;
                mpg = row.Cells[11].Text;
                doors = row.Cells[12].Text;
                transmission = row.Cells[13].Text;
                img = row.Cells[14].Text;

                Response.Redirect("UpdateVehiclesForm.aspx");
            }
           
        }
    }
}

    