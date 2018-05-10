using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration
{
    public partial class ContactDisplay : System.Web.UI.Page
    {
        private CustomerList customers;
        private Customer customer;

        protected void Page_Load(object sender, EventArgs e)
        {
            customers = CustomerList.GetCustomers();
            if (!IsPostBack) DisplayContactList();
        }

        private void DisplayContactList()
        {
            lstContacts.Items.Clear();
            for (int i = 0; i < customers.Count; i++)
            {
                customer = customers[i];
                lstContacts.Items.Add(customer.ContactDisplay());
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (customers.Count > 0)
            {
                if (lstContacts.SelectedIndex > -1)
                {
                    customers.RemoveAt(lstContacts.SelectedIndex);
                    DisplayContactList();
                }
                else
                {
                    lblMessage.Text = "Please select the contact you want to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (customers.Count > 0)
            {
                customers.Clear();
                lstContacts.Items.Clear();
            }
        }
    }
}