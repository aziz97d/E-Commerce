<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="E_Commerce.User" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlUserNew" runat="server">Add User</asp:HyperLink>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceUser" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11"  runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("gender") %>'>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Femal</asp:ListItem>
                    </asp:RadioButtonList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Of Birth" SortExpression="dateOfBirth">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("dateOfBirth") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("dateOfBirth") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Join Date" SortExpression="joinDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("joinDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("joinDate") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Join IP" SortExpression="joinIp">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("joinIp") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("joinIp") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="cityId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCity" runat="server" SelectedValue='<%# Bind("cityId") %>' DataSourceID="SqlDataSourceCity" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCity" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [city]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id AND [name] = @original_name AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND [email] = @original_email AND [password] = @original_password AND [gender] = @original_gender AND [dateOfBirth] = @original_dateOfBirth AND (([joinDate] = @original_joinDate) OR ([joinDate] IS NULL AND @original_joinDate IS NULL)) AND (([joinIp] = @original_joinIp) OR ([joinIp] IS NULL AND @original_joinIp IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND [cityId] = @original_cityId" InsertCommand="INSERT INTO [users] ([name], [contact], [email], [password], [gender], [dateOfBirth], [joinDate], [joinIp], [userType], [address], [cityId]) VALUES (@name, @contact, @email, @password, @gender, @dateOfBirth, @joinDate, @joinIp, @userType, @address, @cityId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT u.[id], u.[name], u.[contact], u.[email], u.[password], u.[gender], u.[dateOfBirth], u.[joinDate], u.[joinIp], u.[userType], u.[address], u.[cityId], ct.[name] as city FROM [users] as u left join [city] as ct on u.cityId=ct.id" UpdateCommand="UPDATE [users] SET [name] = @name, [contact] = @contact, [email] = @email, [password] = @password, [gender] = @gender, [dateOfBirth] = @dateOfBirth, [joinDate] = @joinDate, [joinIp] = @joinIp, [userType] = @userType, [address] = @address, [cityId] = @cityId WHERE [id] = @original_id AND [name] = @original_name AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND [email] = @original_email AND [password] = @original_password AND [gender] = @original_gender AND [dateOfBirth] = @original_dateOfBirth AND (([joinDate] = @original_joinDate) OR ([joinDate] IS NULL AND @original_joinDate IS NULL)) AND (([joinIp] = @original_joinIp) OR ([joinIp] IS NULL AND @original_joinIp IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND [cityId] = @original_cityId">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_contact" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_gender" Type="String" />
            <asp:Parameter Name="original_dateOfBirth" Type="DateTime" />
            <asp:Parameter Name="original_joinDate" Type="DateTime" />
            <asp:Parameter Name="original_joinIp" Type="String" />
            <asp:Parameter Name="original_userType" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="contact" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="dateOfBirth" Type="DateTime" />
            <asp:Parameter Name="joinDate" Type="DateTime" />
            <asp:Parameter Name="joinIp" Type="String" />
            <asp:Parameter Name="userType" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="cityId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="contact" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="dateOfBirth" Type="DateTime" />
            <asp:Parameter Name="joinDate" Type="DateTime" />
            <asp:Parameter Name="joinIp" Type="String" />
            <asp:Parameter Name="userType" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="cityId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_contact" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_gender" Type="String" />
            <asp:Parameter Name="original_dateOfBirth" Type="DateTime" />
            <asp:Parameter Name="original_joinDate" Type="DateTime" />
            <asp:Parameter Name="original_joinIp" Type="String" />
            <asp:Parameter Name="original_userType" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
