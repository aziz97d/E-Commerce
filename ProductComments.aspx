<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductComments.aspx.cs" Inherits="E_Commerce.ProductComments" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlNewProductComment" runat="server" NavigateUrl="~/ProductCommentsNew.aspx">Add Product Comment</asp:HyperLink>
    <br />
    <asp:GridView ID="gvProductComments" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceProductComment">
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("productId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("users") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comments" SortExpression="comments">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comments") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceProductComment" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [productComments] WHERE [id] = @original_id AND [productId] = @original_productId AND [userId] = @original_userId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL))" InsertCommand="INSERT INTO [productComments] ([productId], [userId], [dateTime], [comments]) VALUES (@productId, @userId, @dateTime, @comments)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT pc.[id], pc.[productId], pc.[userId], pc.[dateTime], pc.[comments], u.[name] as users, p.[name] as product FROM [productComments] as pc left join [product] as p on pc.[productId]=p.[id] left join [users] as u on pc.[userId]=u.[id]" UpdateCommand="UPDATE [productComments] SET [productId] = @productId, [userId] = @userId, [dateTime] = @dateTime, [comments] = @comments WHERE [id] = @original_id AND [productId] = @original_productId AND [userId] = @original_userId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_comments" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="comments" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="comments" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_comments" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
