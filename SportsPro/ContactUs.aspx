<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SportsPro.ContactUs" %>
<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="mainPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server">
     <div class="form-group">
        <div class="row"><%-- row 1 --%>
            <div class="col-sm-offset-1 col-sm-11">
                <h2>How to contact us</h2>
            </div>
        </div><%-- end of row 1 --%>
    </div>
    <div class="form-group">
        <div class="row"><%-- row 2 --%>
            <div class="col-sm-offset-1 col-sm-5 options">
                <label>
                    If you ever haave any questions or comments about our products, 
                    please be sure to contact us in whatever way is most convenient for you.
                </label>
            </div>
        </div>
    </div><%-- end of row 2 --%>
    <div class="form-group">
        <div class="row"><%-- row 3 --%>
            <div class="col-sm-offset-1 col-sm-2 options">
                <label>Phone:</label>
            </div>
            <div class="col-sm-9 options"><%-- Contact phone information --%>
                <label class="options">1-800-555-0400</label>
            </div>
            <div class="col-sm-offset-3 col-sm-9 options">
                <label>Weekdays 8 to 5 Pacific Time</label>
            </div>
        </div><%-- end of row 3 --%>
        <div class="row"><%-- row 4 --%>
            <div class="col-sm-offset-1 col-sm-2 options">
                <label>Email:</label>
            </div>
            <div class="col-sm-9 options"><%-- Contact phone information --%>
                <label><asp:HyperLink ID="HyperLink1" runat="server"
                     NavigateURL="sportspro@sportsproosoftware.com">sportspro@sportsproosoftware.com</asp:HyperLink></label>
            </div>
        </div><%-- end of row 4 --%>
        <div class="row"><%-- row 5 --%>
            <div class="col-sm-offset-1 col-sm-2 options">
                <label>Fax:</label>
            </div>
            <div class="col-sm-9 options"><%-- Contact phone information --%>
                <label class="options">1-559-555-2732</label>
            </div>
        </div><%-- end of row 5 --%>
        <div class="row"><%-- row 6 --%>
            <div class="col-sm-offset-1 col-sm-2 options">
                <label>Address:</label>
            </div>
            <div class="col-sm-9 options"><%-- Contact phone information --%>
                <label>SportsPro Software, Inc.</label>
            </div>
            <div class="col-sm-offset-3 col-sm-9 options">
                <label>1500 N Main Street</label>
            </div>
            <div class="col-sm-offset-3 col-sm-9 options">
                <label>Fresno, California 93710</label>
            </div>
        </div><%-- end of row 6 --%>
    </div>
</asp:Content>