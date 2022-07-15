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
    public partial class UpdateCategoriesForm : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string file = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (!string.IsNullOrEmpty(Edit_Categories.CategoriesName))
                {
                    CategoriesName.Text = Edit_Categories.CategoriesName;
                }
               

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (image.HasFile)
            {
                image.SaveAs(Server.MapPath("~/Images/" + image.FileName));
                file = "~/Images/" + image.FileName;
            }
            using (con = new SqlConnection(cs))
            {
                //uses sql Stored Procedure for query
                //query uses all of these values to insert
               
                var img = Edit_Categories.img;
                con.Open();
                if (changeImg.Checked == true)
                {
                    img = file;
                    cmd = new SqlCommand("SP_Update_Category_Img", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@oldCategoriesName", Edit_Categories.CategoriesName);
                    cmd.Parameters.AddWithValue("@newCategoriesName", CategoriesName.Text);
                    cmd.Parameters.AddWithValue("@img", img);
                    cmd.ExecuteNonQuery();
                   
                }
                else
                {
                    
                    cmd = new SqlCommand("SP_Update_Category", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@oldCategoriesName", Edit_Categories.CategoriesName);
                    cmd.Parameters.AddWithValue("@newCategoriesName", CategoriesName.Text);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                Response.Redirect("Edit_Categories.aspx");

            }
            
            
        }

    }
}