<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="SportsPro.SurveyComplete" %>
<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <title>Survey Complete</title>
</asp:Content>
<asp:Content ID="mainPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
    <div class="col-sm-offset-1 col-sm-11 options">
            <h2>Thank you for your feedback!</h2>
        </div>
    <div class="form-group message">
        <div class="col-sm-offset-1 col-sm-11">
           <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-3">
             <asp:Button ID="btnReturn" runat="server" Text="Return to Survey"
                    CssClass="btn btn-primary submit-btn" PostBackUrl="~/CustomerSupport/CustomerSurvey"  />
        </div>
    </div>
</asp:Content>