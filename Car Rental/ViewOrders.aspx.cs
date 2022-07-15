using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class ViewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get session from customerID
            int customerID = (int)Session["customerID"];

            //update datasource with customerID for datalist
            SqlDataSource1.SelectParameters.Add("customerID", customerID.ToString());
            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
            SqlDataSource1.SelectCommand = "SP_Select_Orders";
        }
    }
}