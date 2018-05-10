using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
        private Customer selectedCustomer;

        // bind drop-down list and update page hit count on first load  
        protected void Page_Load(object sender, EventArgs e)
        {
            //bind drop-down list on first load   
            if (!IsPostBack) ddlCustomers.DataBind();
            ShowSelectedCustomer();
        }

        private void ShowSelectedCustomer()
        {
            // get and show customer data on every load  
            selectedCustomer = new Customer();
            selectedCustomer = GetSelectedCustomer();
            lblAddress.Text = selectedCustomer.Address + "<br>" +
                    selectedCustomer.City + ", " + selectedCustomer.State + " " + selectedCustomer.ZipCode;
            lblPhone.Text = selectedCustomer.Phone;
            lblEmail.Text = selectedCustomer.Email;
        }

        private Customer GetSelectedCustomer()
        {
            //get row from SqlDataSource based on value in drop-down list
            DataView customersTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customersTable.RowFilter = string.Format("CustomerID = '{0}'",
                ddlCustomers.SelectedValue);
            DataRowView row = customersTable[0];

            //create a new customer object and load with data from row
            Customer c = new Customer();
            c.CustomerID = (int)row["CustomerID"];
            c.Name = row["Name"].ToString();
            c.Address = row["Address"].ToString();
            c.City = row["City"].ToString();
            c.State = row["State"].ToString();
            c.ZipCode = row["ZipCode"].ToString();
            c.Phone = row["Phone"].ToString();
            c.Email = row["Email"].ToString();
            return c;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected item from cart
                CustomerList customers = CustomerList.GetCustomers();
                Customer customer = customers[selectedCustomer.Name];

                //if customer isn’t in contact list, add it; else display error message
                if (customer == null)
                {
                    customers.AddItem(selectedCustomer);
                    Response.Redirect("~/Administration/ContactDisplay");
                }
                else
                {
                    lblMessage.Text = selectedCustomer.Name + " has already been added to the Contact List.";
                }
            }
        }
    }

    public static class MessageBox
    {
        public static void Show(this Page Page, String Message)
        {
            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               "<script language='javascript'>alert('" + Message + "');</script>"
            );
        }
    }
}