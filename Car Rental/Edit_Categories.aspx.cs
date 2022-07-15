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

namespace Car_Rental
{
    
    public partial class Edit_Categories : System.Web.UI.Page
    {
       
         
        public static string CategoriesName;
        public static string img;
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SearchCategories();
            }

        }
        private void SearchCategories()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM Categories";                   
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
            
        }

      

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if row 'Edit' is clicked
            if (e.CommandName == "Edit")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                //pass row variable from grid
                CategoriesName = row.Cells[0].Text;
                img = row.Cells[1].Text;
                Response.Redirect("UpdateCategoriesForm.aspx");
            }
           
        }
    }
}