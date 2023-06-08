<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerTransactions.aspx.cs" Inherits="WebApplicationShoppingCartFlowerShop.ShopUser.CustomerTransactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="font-family: Arial; font-size: medium; color: #008080; background-color: #CCCCCC; font-weight: bold; text-align: center;"><h3>Transactions for
         <asp:Label ID="Label2" runat="server"></asp:Label>
         </h3></div>
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderID" DataSourceID="SqlDSOrder" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" >
        <ItemStyle Font-Bold="True" ForeColor="#0066CC" />
        </asp:CommandField>
        <asp:BoundField DataField="OrderID" HeaderText="Number" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" >
        <ItemStyle HorizontalAlign="Left" Width="125px" />
        </asp:BoundField>
        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:c2}" >
        <ItemStyle HorizontalAlign="Center" Width="125px" />
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
        <div style="font-family: Arial; font-size: medium; color: #008080; background-color: #CCCCCC; font-weight: bold; text-align: center;"><h3>Transaction Details</h3></div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderID,ProdID" DataSourceID="SqlDSOrderDetail" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" SortExpression="ProdID" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
            <ItemStyle Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice" DataFormatString="{0:c2}" >
            <ItemStyle Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="Sub" HeaderText="SubTotal" SortExpression="Sub" DataFormatString="{0:c2}" >
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDSOrder" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Order] WHERE ([CustID] = @CustID)">
        <SelectParameters>
            <asp:Parameter Name="CustID" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSOrderDetail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [OrderDetail] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
        </div>
    </asp:Content>
