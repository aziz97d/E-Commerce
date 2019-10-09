<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewLocation.aspx.cs" Inherits="E_Commerce.NewLocation" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <asp:DetailsView ID="dvLocation" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource11" DefaultMode="Insert" Height="50px" OnItemInserted="dvLocation_ItemInserted1" Width="40%">
        <Fields>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Latitude" SortExpression="latitude">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("latitude") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("latitude") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("latitude") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Logitude" SortExpression="logitude">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("logitude") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("logitude") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("logitude") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Param1" SortExpression="param1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("param1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("param1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("param1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charge" SortExpression="charge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("charge") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Text='<%# Bind("charge") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("charge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="cityId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("cityId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    </asp:UpdateProgress>
                    &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="Label8" runat="server" Text="Country"></asp:Label>
                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [country]"></asp:SqlDataSource>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="City"></asp:Label>
                            <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" SelectedValue='<%# Bind("cityId") %>'>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("cityId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [location] WHERE [id] = @original_id AND [name] = @original_name AND (([latitude] = @original_latitude) OR ([latitude] IS NULL AND @original_latitude IS NULL)) AND (([logitude] = @original_logitude) OR ([logitude] IS NULL AND @original_logitude IS NULL)) AND (([param1] = @original_param1) OR ([param1] IS NULL AND @original_param1 IS NULL)) AND (([charge] = @original_charge) OR ([charge] IS NULL AND @original_charge IS NULL)) AND (([cityId] = @original_cityId) OR ([cityId] IS NULL AND @original_cityId IS NULL))" InsertCommand="INSERT INTO [location] ([name], [latitude], [logitude], [param1], [charge], [cityId]) VALUES (@name, @latitude, @logitude, @param1, @charge, @cityId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [latitude], [logitude], [param1], [charge], [cityId] FROM [location]" UpdateCommand="UPDATE [location] SET [name] = @name, [latitude] = @latitude, [logitude] = @logitude, [param1] = @param1, [charge] = @charge, [cityId] = @cityId WHERE [id] = @original_id AND [name] = @original_name AND (([latitude] = @original_latitude) OR ([latitude] IS NULL AND @original_latitude IS NULL)) AND (([logitude] = @original_logitude) OR ([logitude] IS NULL AND @original_logitude IS NULL)) AND (([param1] = @original_param1) OR ([param1] IS NULL AND @original_param1 IS NULL)) AND (([charge] = @original_charge) OR ([charge] IS NULL AND @original_charge IS NULL)) AND (([cityId] = @original_cityId) OR ([cityId] IS NULL AND @original_cityId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_latitude" Type="String" />
            <asp:Parameter Name="original_logitude" Type="String" />
            <asp:Parameter Name="original_param1" Type="String" />
            <asp:Parameter Name="original_charge" Type="Double" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="latitude" Type="String" />
            <asp:Parameter Name="logitude" Type="String" />
            <asp:Parameter Name="param1" Type="String" />
            <asp:Parameter Name="charge" Type="Double" />
            <asp:Parameter Name="cityId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="latitude" Type="String" />
            <asp:Parameter Name="logitude" Type="String" />
            <asp:Parameter Name="param1" Type="String" />
            <asp:Parameter Name="charge" Type="Double" />
            <asp:Parameter Name="cityId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_latitude" Type="String" />
            <asp:Parameter Name="original_logitude" Type="String" />
            <asp:Parameter Name="original_param1" Type="String" />
            <asp:Parameter Name="original_charge" Type="Double" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
