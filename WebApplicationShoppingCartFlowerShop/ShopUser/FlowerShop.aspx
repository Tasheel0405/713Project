<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlowerShop.aspx.cs" Inherits="WebApplicationShoppingCartFlowerShop.ShopUser.FlowerShop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="float: left">
        <asp:Label ID="lblDate" runat="server" Text="Label" Font-Bold="True" Font-Size="Small" ForeColor="#009933"></asp:Label></div>
     <div style="clear:both"></div>
    <div style="float: right">
        <asp:DetailsView ID="DetailsViewCustomer" runat="server" Height="50px" Width="205px" AutoGenerateRows="False" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="CustID" DataSourceID="SqlDSCustomer" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDSCustomer" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustID] = @original_CustID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Surname] = @original_Surname) OR ([Surname] IS NULL AND @original_Surname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([ContactNo] = @original_ContactNo) OR ([ContactNo] IS NULL AND @original_ContactNo IS NULL))" InsertCommand="INSERT INTO [Customer] ([FirstName], [Surname], [email], [ContactNo]) VALUES (@FirstName, @Surname, @email, @ContactNo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer] WHERE ([email] = @email)" UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [Surname] = @Surname, [email] = @email, [ContactNo] = @ContactNo WHERE [CustID] = @original_CustID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Surname] = @original_Surname) OR ([Surname] IS NULL AND @original_Surname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([ContactNo] = @original_ContactNo) OR ([ContactNo] IS NULL AND @original_ContactNo IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_ContactNo" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ContactNo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="email" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ContactNo" Type="String" />
                <asp:Parameter Name="original_CustID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_ContactNo" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
       <div style="float: left;">
        <asp:GridView ID="GridViewFlowers" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="FlowerID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="231px" Width="605px" OnRowCommand="GridViewFlowers_RowCommand" BorderColor="#006699" BorderStyle="Solid" BorderWidth="7px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="FlowerID" HeaderText="FlowerID" InsertVisible="False" ReadOnly="True" SortExpression="FlowerID" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Desciption" HeaderText="Desciption" SortExpression="Desciption" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c2}" />
                <asp:BoundField DataField="QoH" HeaderText="QoH" SortExpression="QoH" />
                
                <asp:ImageField DataImageUrlField="Desciption" DataImageUrlFormatString="~/Flowers/{0}.jpg">
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlQuantity" runat="server" AutoPostBack="True" Height="39px" Width="82px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:ButtonField ButtonType="Button" CommandName="btnClick" Text="Add to Cart" />
                
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
         <div style="position: fixed; right: 90px; top: 50%;">
        <h4 style="font-family: Arial; font-size: medium; color: #008080; font-weight: bold;">My Shopping Cart&nbsp; Amount Due:&nbsp<asp:Label ID="lblAmountDue" runat="server" Text="R0" Font-Bold="True" ForeColor="#CC3300"></asp:Label> </h4>
        <asp:GridView ID="gridShopCart" runat="server" Width="70px" BorderColor="Black" BorderStyle="Solid" BorderWidth="8px" CellPadding="10" ForeColor="#333333" CellSpacing="10" HeaderStyle-HorizontalAlign="Center" OnRowDeleting="gridShopCart_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" HorizontalAlign="Center" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Medium" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
   <asp:Button ID="btnConfirmSale" runat="server" Text="Finalise Sale" OnClientClick="return ConfirmMessage();" OnClick="btnConfirmSale_Click"/>
    </div>   
        </div>
    <script>
        function ConfirmMessage() {
            if (confirm("Confirm the Sale") == true)
                return true;
            else
                return false;
        }
        
    </script>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Flower]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSRecordSale" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Order] WHERE [OrderID] = @original_OrderID AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL)) AND (([CustID] = @original_CustID) OR ([CustID] IS NULL AND @original_CustID IS NULL))" InsertCommand="INSERT INTO [Order] ([Date], [Amount], [CustID]) VALUES (@Date, @Amount, @CustID); Select @OrderID=Scope_Identity()" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Order]" UpdateCommand="UPDATE [Order] SET [Date] = @Date, [Amount] = @Amount, [CustID] = @CustID WHERE [OrderID] = @original_OrderID AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL)) AND (([CustID] = @original_CustID) OR ([CustID] IS NULL AND @original_CustID IS NULL))" OnInserted="SqlDSRecordSale_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="original_OrderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Date" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_Amount" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_CustID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="lblDate" Name="Date" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="lblAmountDue" Name="Amount" PropertyName="Text" Type="Decimal" />
            <asp:Parameter Name="CustID" Type="Int32"></asp:Parameter>
            <asp:Parameter Direction="Output" Name="OrderID" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Date" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Amount" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="CustID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_OrderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Date" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_Amount" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_CustID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSOrderDetail" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [OrderDetail] WHERE [OrderID] = @original_OrderID AND [ProdID] = @original_ProdID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([UnitPrice] = @original_UnitPrice) OR ([UnitPrice] IS NULL AND @original_UnitPrice IS NULL)) AND (([Sub] = @original_Sub) OR ([Sub] IS NULL AND @original_Sub IS NULL))" InsertCommand="INSERT INTO [OrderDetail] ([OrderID], [ProdID], [Description], [Qty], [UnitPrice], [Sub]) VALUES (@OrderID, @ProdID, @Description, @Qty, @UnitPrice, @Sub)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [OrderDetail]" UpdateCommand="UPDATE [OrderDetail] SET [Description] = @Description, [Qty] = @Qty, [UnitPrice] = @UnitPrice, [Sub] = @Sub WHERE [OrderID] = @original_OrderID AND [ProdID] = @original_ProdID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([UnitPrice] = @original_UnitPrice) OR ([UnitPrice] IS NULL AND @original_UnitPrice IS NULL)) AND (([Sub] = @original_Sub) OR ([Sub] IS NULL AND @original_Sub IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_OrderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_ProdID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Qty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UnitPrice" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Sub" Type="Decimal"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ProdID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="Qty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UnitPrice" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Sub" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="Qty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UnitPrice" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Sub" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_OrderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_ProdID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Qty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UnitPrice" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Sub" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
