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
    public partial class Add_Categories : System.Web.UI.Page
    {
        //var for file path
        string file = string.Empty;


        //vars for sql config, connection, and commands
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //if file is selcted save to file variable 
            if (FileUpload2.HasFile)
            {
                FileUpload2.SaveAs(Server.MapPath("~/Images/" + FileUpload2.FileName));
                file = "~/Images/" + FileUpload2.FileName;
            }

            using (con = new SqlConnection(cs))
            {
                //uses sql Stored Procedure for query
                //query uses all of these values to insert
                con.Open();
                cmd = new SqlCommand("SP_Insert_Category", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@img", file);
                cmd.Parameters.AddWithValue("@CategoriesName", categoryNameTxt.Text);
                cmd.ExecuteNonQuery();
                //close connection
                con.Close();

            }
        }
    }
}