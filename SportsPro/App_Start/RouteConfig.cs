using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace SportsPro
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            // map custom static routes
            routes.MapPageRoute("CustomerSupportProductRegistration", "CustomerSupport/ProductRegistration", "~/ProductRegistration.aspx");
            routes.MapPageRoute("CustomerSupportCustomerSurvey", "CustomerSupport/CustomerSurvey", "~/CustomerSurvey.aspx");
            routes.MapPageRoute("CustomerSupportSurveyComplete", "CustomerSupport/SurveyComplete", "~/SurveyComplete.aspx");
            routes.MapPageRoute("TechSupportCustomerIncidentDisplay", "TechSupport/CustomerIncidentDisplay", "~/CustomerIncidentDisplay.aspx");
            routes.MapPageRoute("TechIncidentUpdate", "TechSupport/IncidentUpdate", "~/IncidentUpdate.aspx");
            routes.MapPageRoute("AdministrationContactDisplay", "Administration/ContactDisplay", "~/Administration/ContactDisplay.aspx");
            routes.MapPageRoute("AdministrationCustomerDisplay", "Administration/CustomerDisplay", "~/Administration/CustomerDisplay.aspx");
            routes.MapPageRoute("AdministrationCustomerMaintenance", "Administration/CustomerMaintenance", "~/Administration/CustomerMaintenance.aspx");
            routes.MapPageRoute("AdministrationIncidentDisplay", "Administration/IncidentDisplay", "~/Administration/IncidentDisplay.aspx");
            routes.MapPageRoute("AdministrationProductMaintenance", "Administration/ProductMaintenance", "~/Administration/ProductMaintenance.aspx");
            routes.MapPageRoute("AdministrationTechnicianIncidentSummary", "Administration/TechnicianIncidentSummary", "~/Administration/TechnicianIncidentSummary.aspx");
            routes.MapPageRoute("AdministrationTechnicianMaintenance", "Administration/TechnicianMaintenance", "~/Administration/TechnicianMaintenance.aspx");
        }
    }

    public class MyUrlResolver : WebFormsFriendlyUrlResolver
    {
        // called when url is traditional (eg, "IncidentDisplay.aspx")
        public override string ConvertToFriendlyUrl(string path)
        {
            if (!string.IsNullOrEmpty(path))
            {
                if (path.Contains("ProductRegistration") || path.Contains("CustomerSurvey") ||
                    path.Contains("SurveyComplete"))
                {
                    return "/CustomerSupport" + path.Replace(".aspx", "");
                }
            }
            if (!string.IsNullOrEmpty(path))
            {
                if (path.Contains("CustomerIncidentDisplay") || path.Contains("IncidentUpdate"))
                {
                    return "/TechSupport" + path.Replace(".aspx", "");
                }
            }
            if (!string.IsNullOrEmpty(path))
            {
                if (path.Contains("Administration/ContactDisplay") || path.Contains("Administration/CustomerDisplay") ||
                    path.Contains("Administration/CustomerMaintenance") || path.Contains("Administration/IncidentDisplay") ||
                    path.Contains("Administration/ProductMaintenance") || path.Contains("Administration/TechnicianIncidentSummary") ||
                    path.Contains("Administration/TechnicianMaintenance"))
                {
                    return path.Replace(".aspx", "");
                }
            }
            return base.ConvertToFriendlyUrl(path);
        }

    }
 }
