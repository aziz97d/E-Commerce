<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="E_Commerce.Status" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlStatusNew" runat="server" NavigateUrl="~/StatusNew.aspx">Add Status</asp:HyperLink>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceSatus">
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Level" SortExpression="level">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("level") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("level") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceSatus" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [status] WHERE [id] = @original_id AND [name] = @original_name AND (([level] = @original_level) OR ([level] IS NULL AND @original_level IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))" InsertCommand="INSERT INTO [status] ([name], [level], [description]) VALUES (@name, @level, @description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [level], [description] FROM [status]" UpdateCommand="UPDATE [status] SET [name] = @name, [level] = @level, [description] = @description WHERE [id] = @original_id AND [name] = @original_name AND (([level] = @original_level) OR ([level] IS NULL AND @original_level IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_level" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="level" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="level" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_level" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
