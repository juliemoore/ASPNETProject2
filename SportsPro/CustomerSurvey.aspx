<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="SportsPro.CustomerSurvey" %>
<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <title>Customer Survey</title>
</asp:Content>
<asp:Content ID="mainPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
    <div class="form-group row options"><%-- row 1 --%>
        <label class="col-sm-2  options">
            Enter your customer ID:
        </label>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCustomerID" runat="server"
                CssClass="form-control"></asp:TextBox></div>
        <div class="col-sm-3">
            <asp:Button ID="btnGetIncident" runat="server"
                Text="Get Incidents" OnClick="btnGetIncident_Click"
                CssClass="btn btn-primary list-btn" ValidationGroup="CustomerID" />
        </div>
        <div class="col-sm-3">
            <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" 
                ErrorMessage="CustomerID re-entry" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtCustomerID"
                ValidationGroup="CustomerID">Required</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvCustomerID" runat="server" 
                ErrorMessage="CustomerID re-entry" CssClass="text-danger" Display="Dynamic"
                ControlToValidate="txtCustomerID" Operator="DataTypeCheck"
                Type="Integer" ValidationGroup="CustomerID">CustomerID must be an integer</asp:CompareValidator>
        </div>
    </div>
    <div class ="form-group">
        <div class="col-sm-12"><%-- row 2 --%>
            <p><asp:Label ID="lblError" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label></p>
        </div>
    </div>
    <div class="form-group">
        <div class="row"><%-- row 3 --%>   
            <div class="col-sm-12"><%-- row 3 --%>
                <div class="form-group">
                    <div class="col-sm-9">
                        <div class="col-sm-12"><asp:ListBox ID="lstIncidents" runat="server" 
                            CssClass="form-control">
                            <asp:ListItem Selected="False"></asp:ListItem> </asp:ListBox>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                            SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="rfvLstIncidents" runat="server" 
                            ErrorMessage="Incident selection required" CssClass="text-danger" 
                            Display="Dynamic" ControlToValidate="lstIncidents"
                            ValidationGroup="Incidents">You must select an incident</asp:RequiredFieldValidator>
                    </div>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ErrorMessage="You must select a valid incident to continue" 
                        ValidationGroup="Incidents"
                        ControlToValidate="lstIncidents"  CssClass="text-danger"
                        OnServerValidate="lstIncidentsValidate">*</asp:CustomValidator>
                </div>
            </div>
        </div>
    </div>
    <%-- Customer survey --%>
    <div class="form-group">
        <div class="col-sm-12"><%-- row 4 --%>
        <label>Please rate this incident by the following categories:</label>
    </div>
        <div class="col-sm-12 options"><%-- row 5 --%>
                <label class="col-sm-2 options">Response time:</label>
                <label class="options"><asp:RadioButtonList ID="rblResponseTime" runat="server"
                    class="col-sm-10" RepeatDirection="Horizontal" CssClass="radioButtonList" Enabled="False" DataValueField="3">
                    <asp:ListItem Value="1" Text="Not satisfied"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Somewhat satisfied"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Satisfied"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Completely satisfied"></asp:ListItem>
                </asp:RadioButtonList></label>

        </div>
        <div class="col-sm-12 options"><%-- row 6 --%>
                 <label class="col-sm-2 options">Technician efficiency:</label>
                <label class="options"><asp:RadioButtonList ID="rblTechEfficiency" runat="server"
                    class="col-sm-10" RepeatDirection="Horizontal" CssClass="radioButtonList" DataValueField="3">
                    <asp:ListItem Value="1" Text="Not satisfied"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Somewhat satisfied"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Satisfied"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Completely satisfied"></asp:ListItem>
                </asp:RadioButtonList></label>
        </div>
        <div class="col-sm-12 options"><%-- row 7 --%>
                <label class="col-sm-2 options">Problem resolution:</label>
                <label class="options"><asp:RadioButtonList ID="rblResolution" runat="server"
                    class="col-sm-10" RepeatDirection="Horizontal" CssClass="radioButtonList" Enabled="False" DataValueField="3">
                    <asp:ListItem Value="1" Text="Not satisfied"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Somewhat satisfied"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Satisfied"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Completely satisfied"></asp:ListItem>
                </asp:RadioButtonList></label>
        </div>
    </div>
    <div class="col-sm-12 options"><%-- row 8 --%>
        <div class="form-group options">
            <label class="col-sm-2 options">Additional comments:</label>
            <div class="col-sm-7">
                <asp:TextBox ID="txtComments" runat="server" TextMode="Multiline"
                        Rows="4" CssClass="form-control" Enabled="False"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-sm-12"><%-- row 9 --%>
        <div class="form-group">
            <label class="options"><asp:CheckBox ID="chkContact" runat="server" 
                class="col-sm-12" Text="Please contact me to discusss this incident" Enabled="false"/></label>
                <label class="col-sm-offset-1 col-sm-11 options"><asp:RadioButton ID="rdoEmail" runat="server" 
                    Text="Contact by email" GroupName="Contact" Enabled="False" /></label>
                <label class="col-sm-offset-1 col-sm-11 options"><asp:RadioButton ID="rdoPhone" runat="server" 
                    Text="Contact by phone" GroupName="Contact" Enabled="False" /></label>
        </div>
    </div>
    <%-- Submit and button --%>
    <div class="form-group">
        <div class="col-sm-3">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                CssClass="btn btn-primary submit-btn" OnClick="btnSubmit_Click"
                ValidationGroup="Incidents"  />
        </div>
    </div> 
</asp:Content>