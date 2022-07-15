
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Linq;

using System.Net.Mail;

namespace Car_Rental
{
    public partial class ViewVehicle : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public int customerID;
        public string TOTAL_PRICE;
        public string vehicle;
        public string storeID;
        public double totalPrice;
        public double totalPricePass;
        public DateTime dropoff1;
        public DateTime pickUP;
        public string dropOff = _Default.dropOffDate + " " + _Default.dropOffTime;
        public string pickup = _Default.pickupDate + " " + _Default.pickupTime;
        public static bool wasClickedFromView;
        public bool wasclicked;
        public static bool leaveReservationPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            vehicle = (string)Session["vehicleID"];
            if (!string.IsNullOrEmpty(vehicle))
            {
                //update datasource with vehicleID
                SqlDataSource1.SelectParameters.Add("vehicleID", vehicle);
                SqlDataSource1.SelectCommand = "Select * From Vehicles where (vehicleID = @vehicleID) ";

            }


        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            if (!string.IsNullOrEmpty(_Default.dropOffDate) && !string.IsNullOrEmpty(_Default.pickupDate))
            {

                //get label 'totalPriceLbl', 'hiddenPrice' from datalist
                Label lnkBtn6 = (Label)e.Item.FindControl("totalPriceLbl");
                Label lnkBtn7 = (Label)e.Item.FindControl("hiddenPrice");
                dropoff1 = DateTime.Parse(dropOff);
                pickUP = DateTime.Parse(pickup);

                TimeSpan totalTIME = (dropoff1 - pickUP);
                int totalDays = totalTIME.Days;
                string todayPrice = lnkBtn7.Text;
                string trimmedPrice;
                //take off any letters
                trimmedPrice = Regex.Replace(lnkBtn6.Text, "[^0-9.]", "");
                double price = Convert.ToDouble(trimmedPrice);
                //get total price
                totalPrice = totalDays * price;
                Session["totalPrice"] = totalPrice;
                Session["dayPrice"] = todayPrice;
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            wasClickedFromView = true;
            if (Login.loggedin == true)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                leaveReservationPage = true;
                Response.Redirect("Login.aspx");
            }


        }
    }
}

