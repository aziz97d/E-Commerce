<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Commerce.Register" %>
<asp:Content ID="Header" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="dvRegister" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSourceRegister" DefaultMode="Insert"  OnItemInserted="dvRegister_ItemInserted" OnItemInserting="dvRegister_ItemInserting">
        <Fields>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="#FF3300" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ForeColor="#FF3300" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ForeColor="#FF3300" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox3"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password &lt;br&gt; Re-Type Password" SortExpression="password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ForeColor="#FF3300" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ForeColor="#FF3300" ControlToValidate="TextBox12"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox12" ErrorMessage="Missmatch" ForeColor="#FF3300"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" SelectedValue='<%# Bind("gender") %>' runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Required" ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0" ControlToValidate="ddlGender"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Of Birth" SortExpression="dateOfBirth">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("dateOfBirth") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" Text='<%# Bind("dateOfBirth") %>' TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("dateOfBirth") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Join Date" SortExpression="joinDate" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("joinDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" Text='<%# Bind("joinDate") %>' TextMode="Date"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("joinDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Join Ip" SortExpression="joinIp" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("joinIp") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" Text='<%# Bind("joinIp") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("joinIp") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Type" SortExpression="userType" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("userType") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" Text='<%# Bind("userType") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("userType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" Height="60px" Text='<%# Bind("address") %>' TextMode="MultiLine" Width="159px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country &lt;br&gt; City" SortExpression="cityId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("cityId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCountry" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Required" ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [country]"></asp:SqlDataSource>
                            <br />
                            <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlCity" ErrorMessage="Required" ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("cityId") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSourceRegister" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id AND [name] = @original_name AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND [email] = @original_email AND [password] = @original_password AND [gender] = @original_gender AND [dateOfBirth] = @original_dateOfBirth AND (([joinDate] = @original_joinDate) OR ([joinDate] IS NULL AND @original_joinDate IS NULL)) AND (([joinIp] = @original_joinIp) OR ([joinIp] IS NULL AND @original_joinIp IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND [cityId] = @original_cityId" InsertCommand="INSERT INTO [users] ([name], [contact], [email], [password], [gender], [dateOfBirth], [joinDate], [joinIp], [userType], [address], [cityId]) VALUES (@name, @contact, @email, @password, @gender, @dateOfBirth, @joinDate, @joinIp, @userType, @address, @cityId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [contact], [email], [password], [gender], [dateOfBirth], [joinDate], [joinIp], [userType], [address], [cityId] FROM [users]" UpdateCommand="UPDATE [users] SET [name] = @name, [contact] = @contact, [email] = @email, [password] = @password, [gender] = @gender, [dateOfBirth] = @dateOfBirth, [joinDate] = @joinDate, [joinIp] = @joinIp, [userType] = @userType, [address] = @address, [cityId] = @cityId WHERE [id] = @original_id AND [name] = @original_name AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND [email] = @original_email AND [password] = @original_password AND [gender] = @original_gender AND [dateOfBirth] = @original_dateOfBirth AND (([joinDate] = @original_joinDate) OR ([joinDate] IS NULL AND @original_joinDate IS NULL)) AND (([joinIp] = @original_joinIp) OR ([joinIp] IS NULL AND @original_joinIp IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND [cityId] = @original_cityId">
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
