using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class ReservationConformation : System.Web.UI.Page
    {
        public string cardNumberLabel;
        public Label Label1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //get reservationID session 
            string reservation = (string)Session["reservationID"];

            //update datasource with the the reservationID that was passed to this page via session
            //this will create the datalist
            SqlDataSource1.SelectParameters.Add("reservationID", reservation);
            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
            SqlDataSource1.SelectCommand = "SP_Select_Reservation";
            
            
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //get session cardNumber
            string cardNumber = (string)Session["cardNumber"];
            cardNumberLabel = GetMaskedValue(cardNumber);
            Label1 = e.Item.FindControl("Label8") as Label;
            Label Label9 = e.Item.FindControl("Label9") as Label;
            if (!string.IsNullOrEmpty(cardNumber))
            {
                Label9.Text = "Credit Card Used: " + cardNumberLabel;
            }
           
            cardNumberLabel = Label1.Text;
           
        }

        protected void Label8_Load(object sender, EventArgs e)
        {
            
        }
        public string GetMaskedValue(string value)
        {
            return Regex.Replace(value, ".(?=.{4})", "*");
        }
    }
}