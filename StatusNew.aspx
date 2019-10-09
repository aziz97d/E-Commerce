<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StatusNew.aspx.cs" Inherits="E_Commerce.StatusNew" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:DetailsView ID="dvStatus" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSourceStatus" DefaultMode="Insert"  OnItemInserted="dvStatus_ItemInserted" >
        <Fields>
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
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Level" SortExpression="level">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("level") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("level") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("level") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [status] WHERE [id] = @original_id AND [name] = @original_name AND (([level] = @original_level) OR ([level] IS NULL AND @original_level IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))" InsertCommand="INSERT INTO [status] ([name], [level], [description]) VALUES (@name, @level, @description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [level], [description] FROM [status]" UpdateCommand="UPDATE [status] SET [name] = @name, [level] = @level, [description] = @description WHERE [id] = @original_id AND [name] = @original_name AND (([level] = @original_level) OR ([level] IS NULL AND @original_level IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL))">
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
