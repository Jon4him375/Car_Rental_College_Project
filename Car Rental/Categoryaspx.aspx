<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoryaspx.aspx.cs" Inherits="Car_Rental.Categoryaspx" %>


    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    </asp:Content>
   <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">   
       <table>
    </table>
   <h1 style="text-align:center;">Categories</h1>
       <asp:DataList ID="DataList1" runat="server" DataKeyField="CategoriesName" DataSourceID="SqlDataSource2" Height="293px" Width="579px" RepeatDirection="Horizontal" RepeatColumns="3" >
           <ItemTemplate>
             <table style="margin-left: 75px; text-align: center;">

                  <tr>
                     
                 </tr>
                 <tr>
                     <td style="text-align:center;">
                         <br />
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoriesName")%>' Font-Bold="True" Font-Size="Large"></asp:Label>
                     </td>
                 </tr>
                  
                  <tr>
                     <td>
                          <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Height="230px" ImageUrl='<%# Eval("img") %>' Width="300px" />
                     </td>
                 </tr>                 
                  
                  <tr>
                     <td style="text-align:center;">
                         <br />
                         <asp:Button ID="Button1" runat="server" Text="View" 
                            CommandArgument='<%# Eval("CategoriesName") %>'
                              OnClick="Button1_Click1"/>
                     </td>
                 </tr>
             </table>

           </ItemTemplate>
    </asp:DataList>
      
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource> 

    
</asp:Content>
