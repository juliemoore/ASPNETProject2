using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsPro.Models
{
    public class Incident
    {

        public Incident() { }

        public Incident(int IncidentID, int CustomerID, string ProductCode, int TechID, string DateOpened,
            string DateClosed, string Title)
        {
            this.IncidentID = IncidentID;
            this.CustomerID = CustomerID;
            this.ProductCode = ProductCode;
            this.TechID = TechID;
            this.DateOpened = DateOpened;
            this.DateClosed = DateClosed;
            this.Title = Title;
        }

            public int IncidentID { get; set; }
            public int CustomerID { get; set; }
            public string ProductCode { get; set; }
            public int TechID { get; set; }
            public string DateOpened { get; set; }
            public string DateClosed { get; set; }
            public string Title { get; set; }
        

        public string CustomerIncidentDisplay()
        {
            string displayString = string.Format("Incident for product {0} closed {1} ({2})",
                ProductCode,
                DateClosed,
                Title
            );
            return displayString;
        }
    }
}