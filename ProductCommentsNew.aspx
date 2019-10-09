<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCommentsNew.aspx.cs" Inherits="E_Commerce.ProductCommentsNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="dvProductCommnetNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSourceProductCommentNew" DefaultMode="Insert" Width="40%" OnItemInserted="dvProductCommnetNew_ItemInserted">
        <Fields>
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
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlProduct" CssClass="form-control" runat="server" SelectedValue='<%# Bind("productId") %>' DataSourceID="SqlDataSourceProduct" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlUser" CssClass="form-control" runat="server" SelectedValue='<%# Bind("userId") %>' DataSourceID="SqlDataSourceUser" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("dateTime") %>' TextMode="Date"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment" SortExpression="comments">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comments") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("comments") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceProductCommentNew" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [productComments] WHERE [id] = @original_id AND [productId] = @original_productId AND [userId] = @original_userId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL))" InsertCommand="INSERT INTO [productComments] ([productId], [userId], [dateTime], [comments]) VALUES (@productId, @userId, @dateTime, @comments)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [productId], [userId], [dateTime], [comments] FROM [productComments]" UpdateCommand="UPDATE [productComments] SET [productId] = @productId, [userId] = @userId, [dateTime] = @dateTime, [comments] = @comments WHERE [id] = @original_id AND [productId] = @original_productId AND [userId] = @original_userId AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL))">
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
