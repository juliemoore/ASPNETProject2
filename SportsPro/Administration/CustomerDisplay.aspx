<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="SportsPro.Administration.CustomerDisplay" %>

<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <title>Customer Display</title>
</asp:Content>
<asp:Content ID="mainPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="col-sm-12">
        <div class="form-group">
            <label class="col-sm-3 form-label-select" for="ddlCustomers">Select a customer:</label>
            <div class="col-sm-9">
                <asp:DropDownList ID="ddlCustomers" runat="server"
                    CssClass="form-control" DataSourceID="SqlDataSource1" 
                    DataTextField="Name" DataValueField="CustomerID" Enabled="True" AutoPostBack="True">                                                                                                                                                                                                                                                                                                                                                           
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], 
                [Phone], [Email] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="form-group form-label margin-left">
        <label for="lblAddress" class="col-sm-3 form-label">Address:</label>
        <div class="col-sm-5">
            <asp:Label ID="lblAddress" runat="server" ></asp:Label>
        </div>
    </div>
    <div class="form-group form-label margin-left">
        <label class="col-sm-3 form-label" for="lblPhone">Phone:</label>
        <div class="col-sm-5">
            <asp:Label ID="lblPhone" runat="server"></asp:Label></div>
    </div>
                   

    <div class="form-group form-label margin-left">
        <label class="col-sm-3 form-label" for="lblEmail">Email:</label>
        <div class="col-sm-5">
            <asp:Label ID="lblEmail" runat="server"></asp:Label>                            
        </div>
    </div>
    
    <div class="col-sm-3">
        <asp:Button ID="btnAdd_Contact" runat="server" Text="Add to Contact List"
                onClick="btnAdd_Click" CssClass="btn btn-primary submit-btn" />
    </div>
    <div class="col-sm-3">
        <asp:Button ID="btnContactList" runat="server" Text="Display Contact List"
            PostBackUrl="~/Administration/ContactDisplay.aspx" 
            CausesValidation="false" CssClass="btn btn-primary submit-btn" />
    </div>
    <div class="form-group"><%-- message label --%>
        <div class="col-sm-8">
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
            CssClass="text-info col-sm-12"></asp:Label>
        </div>
    </div>
</asp:Content>
