<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="SportsPro.Administration.ContactDisplay" %>

<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <title>Contact Display</title>
</asp:Content>
<asp:Content ID="mainPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="row"><%-- row 1 --%>
        <div class="col-sm-12">
            <h3 class="h3-header">Contact List:</h3>
        </div>
        <div class="col-sm-6"><%-- customer display column --%>
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="col-sm-12"><asp:ListBox ID="lstContacts" runat="server" CssClass="form-control"></asp:ListBox></div>
                </div>
            </div>
        </div>
        <div class="col-sm-3"><%-- customer edit buttons column --%>
            <div class="form-group">
                <div class="col-sm-12"><asp:Button ID="btnRemove" runat="server" 
                    Text="Remove Contact" onclick="btnRemove_Click" CssClass="btn btn-primary list-btn" /></div>
                <div class="col-sm-12"><asp:Button ID="btnEmpty" runat="server" 
                    Text="Empty List" onclick="btnEmpty_Click" CssClass="btn btn-primary list-btn" /></div>
            </div>
        </div>
    </div><%-- end of row 1 --%>
   
    <div class="form-group"><%-- buttons --%>
        <div class="col-sm-3">
            <asp:Button ID="btnContinue" runat="server"
                PostBackUrl="~/Administration/CustomerDisplay.aspx" 
                Text="Select Additional Customers" CssClass="btn btn-primary submit-btn" />
            <div class="col-sm-12"><%-- message label --%>
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                CssClass="text-info col-sm-12"></asp:Label></div>
        </div>
    </div>
</asp:Content>
