using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_Rental
{
    public partial class _Default : Page
    {
    
    //create static variables that be used across pages
        public static string pickupDate;
        public static string pickupTime;
        public static string dropOffDate;
        public static string dropOffTime;




        protected void Page_Load(object sender, EventArgs e)
        {
            //if user clicked reserve on view vehicles page, and dates are not select
            //you will be redirected to the home page
            //then the error message will show
            if(Checkout.error == true)
            {
                selectDatesError.Text = "Please Select Dates For Reservation";
                selectDatesError.Visible = true;
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            
              //assign static variables that will be passed to other pages
              //this will pass the users date and time selections to the category page
            pickupDate = TextBox1.Text;
            pickupTime = DropDownList1.Text;
            dropOffDate = txtDate.Text;
            dropOffTime = DropDownList2.Text;

            DateTime dropoff = DateTime.Parse(dropOffDate);
            DateTime pickUP = DateTime.Parse(pickupDate);
            int result = DateTime.Compare(dropoff, pickUP);

            //if difference between pick up and drop is less then 0, show error
            if(result < 0)
            {
                selectDatesError.Text = "Please select a drop off date at least a day after pick up";
                selectDatesError.Visible = true;
            }
            else
            {
                Response.Redirect("Categoryaspx.aspx");
                Checkout.error = false;
            }
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void OnSubmit(object sender, EventArgs e)
        {
           
        }
    }
}
