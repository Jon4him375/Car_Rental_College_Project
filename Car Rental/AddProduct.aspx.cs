using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Linq; 
using System.Configuration;

//This page adds new vehicles, and it also adds new categories

namespace Car_Rental
{
    
    public partial class AddProduct : System.Web.UI.Page
    {
        //var for file path
        string file = string.Empty;


        //vars for sql config, connection, and commands
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //remove session 
            Session.Remove("category");
            
        }
        
        
        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //if file is selcted save to file variable 
            if (FileUpload1.HasFile)
            {
                //once file is selected in file explorer, set it to the var 'file'
                FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
                file = "~/Images/" + FileUpload1.FileName;
            }

            if (!string.IsNullOrEmpty(TextBox1.Text) || !string.IsNullOrEmpty(TextBox2.Text))
            {
                
                    using (con = new SqlConnection(cs))
                    {
                        //uses sql Stored Procedure for query
                        //query uses all of these values to insert
                        con.Open();
                        cmd = new SqlCommand("SP_Insert_Vehicle", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@storeID", 1);
                        cmd.Parameters.AddWithValue("@make", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@model", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@year", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@vinNumber", TextBox12.Text);
                        cmd.Parameters.AddWithValue("@color", TextBox4.Text);
                        cmd.Parameters.AddWithValue("@price", TextBox7.Text);
                        cmd.Parameters.AddWithValue("@description", TextBox8.Text);
                        cmd.Parameters.AddWithValue("@img", file);
                        cmd.Parameters.AddWithValue("@license_plate", TextBox5.Text);
                        cmd.Parameters.AddWithValue("@CategoriesName", DropDownList2.Text);
                        cmd.Parameters.AddWithValue("@luggage", TextBox11.Text);
                        cmd.Parameters.AddWithValue("@mpg", TextBox9.Text);
                        cmd.Parameters.AddWithValue("@doors", TextBox10.Text);
                        cmd.Parameters.AddWithValue("@transmission", DropDownList3.Text);
                    //sql command... excecute non query
                        cmd.ExecuteNonQuery();
                    //close connection
                        con.Close();



                    }
                    Response.Redirect("Default.aspx");
                }
                
        }
      
    }
}