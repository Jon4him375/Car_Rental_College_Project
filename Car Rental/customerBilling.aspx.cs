using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;
using System.Text;

namespace Car_Rental
{
    public partial class customerBilling : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string file = string.Empty;
        public string customer_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                using (con = new SqlConnection(cs))
                {
                    SqlDataSource1.SelectParameters.Add("customerID", customerReport.customer_ID);
                    SqlDataSource1.SelectCommand = "Select reservationID From Reservation where customerID=@customerID";
                    //retrieve customer billing data and apply it to the page 
                   
                }
                con.Close();

                id.Text = customerReport.customer_ID;


                if (!string.IsNullOrEmpty(customerReport.firstName))
                {
                    firstName.Text = customerReport.firstName;
                }
                if (!string.IsNullOrEmpty(customerReport.lastName))
                {
                    lastName.Text = customerReport.lastName;
                }
                if (!string.IsNullOrEmpty(customerReport.phoneNumber))
                {
                    phoneNumber.Text = customerReport.phoneNumber;
                }

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            try
            {


                //create and download a csv
               
                string date = DateTime.UtcNow.ToShortDateString();
                string file = "customer" + customerReport.firstName + customerReport.lastName + date + ".csv";
              
                StringBuilder csv = new StringBuilder();
                csv.AppendLine("customerid,first name,last name,Phone number,bill,make,model,card number,pick up,drop off");
                csv.AppendLine(id.Text + "," + firstName.Text + "," + lastName.Text + "," + phoneNumber.Text + "," + bill.Text + "," + make.Text + "," + model.Text + "," + cardNumber.Text + "," + pickUp.Text + "," + dropOff.Text);                
                Response.ContentType = "Application/x-msexcel";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" +file);                
                Response.Write(csv.ToString());
                Response.End();
                
            }
            catch (Exception)
            {
               
            }


        }

        protected void ReservationNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ReservationNumber.Text != "Please Select Reservation ID") {

                using (SqlConnection con = new SqlConnection(cs))
                {
                    // get all info from Credit_Card table where cardNumber = @cardNumber
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Reservation LEFT JOIN Vehicles ON Reservation.vehicleID = Vehicles.vehicleID where reservationID = @reservationID"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@reservationID", ReservationNumber.SelectedValue);
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            bill.Text = dr["totalPrice"].ToString();
                            make.Text = dr["make"].ToString();
                            model.Text = dr["model"].ToString();
                            cardNumber.Text = dr["cardNumberUsed"].ToString();
                            pickUp.Text = dr["pickupDate"].ToString();
                            dropOff.Text = dr["dropOffDate"].ToString();

                        }

                        con.Close();
                    }
                }
            }
        }
    }
}
