<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Car_Rental._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
           <div class="panel-heading" style="text-align:center" ><h1>Moraine Park Car Rental</h1></div>
       </div>
    <div class="jumbotron" >
       
        <div class="wrapper">
            <div class="item"> <img src ="/Images/buick.png" alt="buick" style="min-width: 110px;
    height: 110px;"></div>
            <div class="item"> <img src ="/Images/\hyundai.png" style="min-width: 110px;
    height: 110px;"></div>
            <div class="item"> <img src ="/Images/vw.png" alt="buick" style="min-width: 110px;
    height: 110px;""></div>
            <div class="item"> <img src ="/Images/supra.png" alt="buick" style="min-width: 110px;
    height: 110px;""></div>
            <div class="item"> <img src ="/Images/ford250.png" alt="buick" style="min-width: 110px;
    height: 117px; width: 302px;">
            </div>            
        </div>
    </div>
    <div class="container">
  <div class="panel panel-primary" >
    <div class="panel-heading" style="text-align:center" ><h4>Car Rental Reservation Date</h4></div>
      
                
         <table style="width: 100%; ">
                       <tr>
                           <td style="width: 50%; padding-left: 22%; height: 20px; font-size: large;" ><label class="control-label">Pick Up Date</label><br /></td>
                           
                           <td style="width: 50%; padding-left: 22%; height: 20px; font-size: large;"><label class="control-label">Drop Off Date</label><br /></td>
                          
                       </tr>
             <tr>
                 
                 <td style="width: 50%">   <asp:TextBox ID="TextBox1" runat="server" ReadOnly="False" Width="50%" > Please Enter Pick Up Date</asp:TextBox> <asp:DropDownList ID="DropDownList1" runat="server" Width="50%" Height="26px">
                     <asp:ListItem>12:00 AM</asp:ListItem>
                     <asp:ListItem>1:00 AM</asp:ListItem>
                     <asp:ListItem>2:00 AM</asp:ListItem>
                     <asp:ListItem>3:00 AM</asp:ListItem>
                     <asp:ListItem>4:00 AM</asp:ListItem>
                     <asp:ListItem>5:00 AM</asp:ListItem>
                     <asp:ListItem>6:00 AM</asp:ListItem>
                     <asp:ListItem>7:00 AM</asp:ListItem>
                     <asp:ListItem>8:00 AM</asp:ListItem>
                     <asp:ListItem>9:00 AM</asp:ListItem>
                     <asp:ListItem>10:00 AM</asp:ListItem>
                     <asp:ListItem>11:00 AM</asp:ListItem>
                     <asp:ListItem>12:00 PM</asp:ListItem>
                     <asp:ListItem>1:00 PM</asp:ListItem>
                     <asp:ListItem>2:00 PM</asp:ListItem>
                     <asp:ListItem>3:00 PM</asp:ListItem>
                     <asp:ListItem>4:00 PM</asp:ListItem>
                     <asp:ListItem>5:00 PM</asp:ListItem>
                     <asp:ListItem>6:00 PM</asp:ListItem>
                     <asp:ListItem>7:00 PM</asp:ListItem>
                     <asp:ListItem>8:00 PM</asp:ListItem>
                     <asp:ListItem>9:00 PM</asp:ListItem>
                     <asp:ListItem>10:00 PM</asp:ListItem>
                     <asp:ListItem>11:00 PM</asp:ListItem>
                     </asp:DropDownList></td>      
                  <td style="width: 50%">   <asp:TextBox ID="txtDate" runat="server" ReadOnly="False" style="width: 50%" >Please Enter Drop Off Date</asp:TextBox><asp:DropDownList ID="DropDownList2" runat="server" Width="50%" Height="26px">
                      
                      <asp:ListItem>12:00 AM</asp:ListItem>
                     <asp:ListItem>1:00 AM</asp:ListItem>
                     <asp:ListItem>2:00 AM</asp:ListItem>
                     <asp:ListItem>3:00 AM</asp:ListItem>
                     <asp:ListItem>4:00 AM</asp:ListItem>
                     <asp:ListItem>5:00 AM</asp:ListItem>
                     <asp:ListItem>6:00 AM</asp:ListItem>
                     <asp:ListItem>7:00 AM</asp:ListItem>
                     <asp:ListItem>8:00 AM</asp:ListItem>
                     <asp:ListItem>9:00 AM</asp:ListItem>
                     <asp:ListItem>10:00 AM</asp:ListItem>
                     <asp:ListItem>11:00 AM</asp:ListItem>
                     <asp:ListItem>12:00 PM</asp:ListItem>
                     <asp:ListItem>1:00 PM</asp:ListItem>
                     <asp:ListItem>2:00 PM</asp:ListItem>
                     <asp:ListItem>3:00 PM</asp:ListItem>
                     <asp:ListItem>4:00 PM</asp:ListItem>
                     <asp:ListItem>5:00 PM</asp:ListItem>
                     <asp:ListItem>6:00 PM</asp:ListItem>
                     <asp:ListItem>7:00 PM</asp:ListItem>
                     <asp:ListItem>8:00 PM</asp:ListItem>
                     <asp:ListItem>9:00 PM</asp:ListItem>
                     <asp:ListItem>10:00 PM</asp:ListItem>
                     <asp:ListItem>11:00 PM</asp:ListItem>

                      </asp:DropDownList></td>
                      
             </tr>
      </table>
      <div style="text-align: center; border: 1px solid;" >
          <br />
            <asp:Button ID="Button1" runat="server" Text="Search" style="text-align: center ;"  OnClick="Button1_Click1" Height="29px" Width="68px"/>  
          <br />
          <asp:Label ID="selectDatesError" runat="server" Font-Size="Medium" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
          <br />
      </div>
     
      <asp:Panel ID="Panel1" runat="server" style="text-align: center; border: 1px solid;">
          <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/Images/carad.jpg" Width="60%" />
      </asp:Panel>
    </div>
          <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script><script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script><link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" /><!-- Bootstrap --><!-- Bootstrap DatePicker --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
        type="text/css" /><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"
        type="text/javascript"></script><!-- Bootstrap DatePicker --><script type="text/javascript">
                                                                         $(function () {
                                                                             $('[id*=txtDate]').datepicker({
                                                                                 changeMonth: true,
                                                                                 changeYear: true,
                                                                                 format: "mm/dd/yyyy",
                                                                                 language: "tr"
                                                                             });
                                                                         });
                                                                         $(function () {
                                                                             $('[id*=TextBox1]').datepicker({
                                                                                 changeMonth: true,
                                                                                 changeYear: true,
                                                                                 format: "mm/dd/yyyy",
                                                                                 language: "tr"
                                                                             });
                                                                         });

        </script></div>
</asp:Content>
