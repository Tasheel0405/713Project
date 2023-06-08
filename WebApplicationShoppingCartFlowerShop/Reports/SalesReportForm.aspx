<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesReportForm.aspx.cs" Inherits="WebApplicationShoppingCartFlowerShop.Reports.SalesReportForm" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <asp:Button ID="btnShowReport" runat="server" Text="Show Sales Report" OnClick="btnShowReport_Click" />
    </div>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reports\CrystalReportSales.rpt">
        </Report>
    </CR:CrystalReportSource>
    </asp:Content>
