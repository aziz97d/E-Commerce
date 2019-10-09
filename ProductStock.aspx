<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductStock.aspx.cs" Inherits="E_Commerce.ProductStock" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlProductStockNew" runat="server">Add Stock IN/OUT</asp:HyperLink>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="productId" DataSourceID="SqlDataSourceProductStock1">
        <Columns>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="In Qty" SortExpression="inQty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("inQty") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("inQty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Out Qty" SortExpression="outQty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("outQty") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("outQty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceProductStock1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [produtStock] WHERE [productId] = @original_productId AND (([inQty] = @original_inQty) OR ([inQty] IS NULL AND @original_inQty IS NULL)) AND (([outQty] = @original_outQty) OR ([outQty] IS NULL AND @original_outQty IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL))" InsertCommand="INSERT INTO [produtStock] ([productId], [inQty], [outQty], [remarks], [dateTime]) VALUES (@productId, @inQty, @outQty, @remarks, @dateTime)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ps.[productId], ps.[inQty], ps.[outQty], ps.[remarks], ps.[dateTime], p.[name] as product FROM [produtStock] as ps left join product as p on ps.productId=p.id" UpdateCommand="UPDATE [produtStock] SET [inQty] = @inQty, [outQty] = @outQty, [remarks] = @remarks, [dateTime] = @dateTime WHERE [productId] = @original_productId AND (([inQty] = @original_inQty) OR ([inQty] IS NULL AND @original_inQty IS NULL)) AND (([outQty] = @original_outQty) OR ([outQty] IS NULL AND @original_outQty IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_inQty" Type="Double" />
            <asp:Parameter Name="original_outQty" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="inQty" Type="Double" />
            <asp:Parameter Name="outQty" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="inQty" Type="Double" />
            <asp:Parameter Name="outQty" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_inQty" Type="Double" />
            <asp:Parameter Name="original_outQty" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
