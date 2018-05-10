using Microsoft.AspNet.FriendlyUrls;
using SportsPro.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        private DataView incidentsTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCustomerID.Focus();
            }
        }

        protected void btnGetIncident_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //get row from AccessDataSource based on value in dropdownlist
                incidentsTable = (DataView)
                    SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                incidentsTable.RowFilter =
                       "CustomerID = '" + txtCustomerID.Text + "' And DateClosed Is Not Null ";

                // Clear ListBox
                lstIncidents.Items.Clear();
                // If there are incidents, then call procedures to display incident(s) and
                // enable controls
                if (incidentsTable.Count > 0)
                {
                    // If there are incidents, then call procedure to display them and enable controls
                    DisplayClosedIncidents();
                    // Enable Controls
                    EnableControls(true);
                    lstIncidents.Focus();
                }
                else
                {
                    lblError.Text = "There are no incidents for that customer.";
                    EnableControls(false);
                }
            }
        }

        protected void lstIncidentsValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (!(lstIncidents.SelectedIndex < 1));
            lblError.Text = "You must select an incident to continue";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Survey survey = new Survey();
                survey.CustomerID = int.Parse(txtCustomerID.Text);
                survey.IncidentID = int.Parse(lstIncidents.SelectedValue);
                if (rblResponseTime.SelectedIndex > -1)
                {
                    survey.ResponseTime = int.Parse(rblResponseTime.SelectedValue);
                }
                if (rblTechEfficiency.SelectedIndex > -1)
                {
                    survey.TechEfficiency = int.Parse(rblTechEfficiency.SelectedValue);
                }
                if (rblResolution.SelectedIndex > -1)
                {
                    survey.Resolution = int.Parse(rblResolution.SelectedValue);
                }
                survey.Comments = txtComments.Text;
                if (chkContact.Checked)
                {
                    survey.Contact = true;

                    if (rdoEmail.Checked)
                    {
                        survey.ContactBy = "Email";
                    }
                    if (rdoPhone.Checked)
                    {
                        survey.ContactBy = "Phone";
                    }
                    Session.Add("Contact", true);
                }
                else
                {
                    survey.Contact = false;
                    Session.Add("Contact", false);
                }
                Response.Redirect("~/CustomerSupport/SurveyComplete");
            }
        }

      private void DisplayClosedIncidents()
        {
            // To format date
            DateTime myDateTime;
            String output;

            lstIncidents.Items.Add(new ListItem("--Select an incident--", "None"));
            foreach (DataRowView row in incidentsTable)
            {
                //create a new product object and load with data from row
                Incident i = new Incident();
                this.Title = Title;
                i.IncidentID = (int)row["IncidentID"];
                i.CustomerID = (int)row["CustomerID"];
                i.ProductCode = row["ProductCode"].ToString();
                i.TechID = (int)row["TechID"];
                i.DateOpened = row["DateOpened"].ToString();
                myDateTime = DateTime.Parse(i.DateOpened);
                output = myDateTime.ToShortDateString();
                i.DateOpened = output;
                i.DateClosed = row["DateClosed"].ToString();
                myDateTime = DateTime.Parse(i.DateClosed);
                output = myDateTime.ToShortDateString();
                i.DateClosed = output;
                i.Title = row["Title"].ToString();
                String text = i.CustomerIncidentDisplay();
                String value = i.IncidentID.ToString();
                lstIncidents.Items.Add(new ListItem(text, value));
            }
            lstIncidents.SelectedIndex = 0;
            lblError.Text = "";
        }

        private void EnableControls(Boolean isValid)
        {
            rblResolution.Enabled = isValid;
            rblResponseTime.Enabled = isValid;
            rblTechEfficiency.Enabled = isValid;
            txtComments.Enabled = isValid;
            chkContact.Enabled = isValid;
            rdoEmail.Enabled = isValid;
            rdoPhone.Enabled = isValid;
        }
    }
}