<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce.Product" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlProductNew" runat="server" NavigateUrl="~/ProductNew.aspx">Add Product</asp:HyperLink>
    <br />
    <asp:GridView ID="dvProduct" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceProduct">
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code" SortExpression="code">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tags" SortExpression="tag">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="categoryId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brand" SortExpression="brandId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("brandId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit" SortExpression="unitId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("unitId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discount" SortExpression="discount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("discount") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("discount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Update" SortExpression="lastUpdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lastUpdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("lastUpdate") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [product] WHERE [id] = @original_id AND [name] = @original_name AND [code] = @original_code AND [tag] = @original_tag AND [categoryId] = @original_categoryId AND [brandId] = @original_brandId AND [unitId] = @original_unitId AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([discount] = @original_discount) OR ([discount] IS NULL AND @original_discount IS NULL)) AND (([lastUpdate] = @original_lastUpdate) OR ([lastUpdate] IS NULL AND @original_lastUpdate IS NULL))" InsertCommand="INSERT INTO [product] ([name], [code], [tag], [categoryId], [brandId], [unitId], [description], [price], [discount], [lastUpdate]) VALUES (@name, @code, @tag, @categoryId, @brandId, @unitId, @description, @price, @discount, @lastUpdate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT p.[id], p.[name], p.[code], p.[tag], p.[categoryId], p.[brandId], p.[unitId], p.[description], p.[price], p.[discount], p.[lastUpdate], ct.[name] as category, b.[name] as brand, u.[name] as unit FROM [product] as p left join [brand] as b on p.[brandId]=b.[id] left join [category] as ct on p.[categoryId]=ct.[id] left join [unit] as u on p.[unitId]=u.[id]" UpdateCommand="UPDATE [product] SET [name] = @name, [code] = @code, [tag] = @tag, [categoryId] = @categoryId, [brandId] = @brandId, [unitId] = @unitId, [description] = @description, [price] = @price, [discount] = @discount, [lastUpdate] = @lastUpdate WHERE [id] = @original_id AND [name] = @original_name AND [code] = @original_code AND [tag] = @original_tag AND [categoryId] = @original_categoryId AND [brandId] = @original_brandId AND [unitId] = @original_unitId AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([discount] = @original_discount) OR ([discount] IS NULL AND @original_discount IS NULL)) AND (([lastUpdate] = @original_lastUpdate) OR ([lastUpdate] IS NULL AND @original_lastUpdate IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_code" Type="String" />
            <asp:Parameter Name="original_tag" Type="String" />
            <asp:Parameter Name="original_categoryId" Type="Int32" />
            <asp:Parameter Name="original_brandId" Type="Int32" />
            <asp:Parameter Name="original_unitId" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_price" Type="Double" />
            <asp:Parameter Name="original_discount" Type="Double" />
            <asp:Parameter Name="original_lastUpdate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="tag" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
            <asp:Parameter Name="brandId" Type="Int32" />
            <asp:Parameter Name="unitId" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="discount" Type="Double" />
            <asp:Parameter Name="lastUpdate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="tag" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
            <asp:Parameter Name="brandId" Type="Int32" />
            <asp:Parameter Name="unitId" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="discount" Type="Double" />
            <asp:Parameter Name="lastUpdate" Type="DateTime" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_code" Type="String" />
            <asp:Parameter Name="original_tag" Type="String" />
            <asp:Parameter Name="original_categoryId" Type="Int32" />
            <asp:Parameter Name="original_brandId" Type="Int32" />
            <asp:Parameter Name="original_unitId" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_price" Type="Double" />
            <asp:Parameter Name="original_discount" Type="Double" />
            <asp:Parameter Name="original_lastUpdate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
