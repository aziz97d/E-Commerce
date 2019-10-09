<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderNew.aspx.cs" Inherits="E_Commerce.OrderNew" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="dvOrder" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSourceOrder" DefaultMode="Insert" Width="40%">
        <Fields>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("dateTime") %>' TextMode="Date"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number" SortExpression="number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" SelectedValue='<%# Bind("userId") %>' DataSourceID="SqlDataSourceUser" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total" SortExpression="total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivary Charge" SortExpression="delivaryCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("delivaryCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Text='<%# Bind("delivaryCharge") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("delivaryCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Others Charge" SortExpression="othersCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("othersCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Method" SortExpression="paymentMethodId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("paymentMethodId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" SelectedValue=<%# Bind("paymentMethodId") %> DataSourceID="SqlDataSourcePayment" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePayment" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [paymentMethod]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("paymentMethodId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivary Address" SortExpression="delivaryAddress">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("delivaryAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" Text='<%# Bind("delivaryAddress") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("delivaryAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" SortExpression="locationId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("locationId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" SelectedValue='<%# Bind("locationId") %>' DataSourceID="SqlDataSourceLocation" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceLocation" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("locationId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orders] WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [number] = @original_number AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([delivaryCharge] = @original_delivaryCharge) OR ([delivaryCharge] IS NULL AND @original_delivaryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL)) AND (([delivaryAddress] = @original_delivaryAddress) OR ([delivaryAddress] IS NULL AND @original_delivaryAddress IS NULL)) AND (([locationId] = @original_locationId) OR ([locationId] IS NULL AND @original_locationId IS NULL))" InsertCommand="INSERT INTO [orders] ([dateTime], [number], [userId], [total], [delivaryCharge], [othersCharge], [paymentMethodId], [delivaryAddress], [locationId]) VALUES (@dateTime, @number, @userId, @total, @delivaryCharge, @othersCharge, @paymentMethodId, @delivaryAddress, @locationId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [dateTime], [number], [userId], [total], [delivaryCharge], [othersCharge], [paymentMethodId], [delivaryAddress], [locationId] FROM [orders]" UpdateCommand="UPDATE [orders] SET [dateTime] = @dateTime, [number] = @number, [userId] = @userId, [total] = @total, [delivaryCharge] = @delivaryCharge, [othersCharge] = @othersCharge, [paymentMethodId] = @paymentMethodId, [delivaryAddress] = @delivaryAddress, [locationId] = @locationId WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [number] = @original_number AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([delivaryCharge] = @original_delivaryCharge) OR ([delivaryCharge] IS NULL AND @original_delivaryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL)) AND (([delivaryAddress] = @original_delivaryAddress) OR ([delivaryAddress] IS NULL AND @original_delivaryAddress IS NULL)) AND (([locationId] = @original_locationId) OR ([locationId] IS NULL AND @original_locationId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_number" Type="String" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Double" />
            <asp:Parameter Name="original_delivaryCharge" Type="Double" />
            <asp:Parameter Name="original_othersCharge" Type="Double" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
            <asp:Parameter Name="original_delivaryAddress" Type="String" />
            <asp:Parameter Name="original_locationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Double" />
            <asp:Parameter Name="delivaryCharge" Type="Double" />
            <asp:Parameter Name="othersCharge" Type="Double" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
            <asp:Parameter Name="delivaryAddress" Type="String" />
            <asp:Parameter Name="locationId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Double" />
            <asp:Parameter Name="delivaryCharge" Type="Double" />
            <asp:Parameter Name="othersCharge" Type="Double" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
            <asp:Parameter Name="delivaryAddress" Type="String" />
            <asp:Parameter Name="locationId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_number" Type="String" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Double" />
            <asp:Parameter Name="original_delivaryCharge" Type="Double" />
            <asp:Parameter Name="original_othersCharge" Type="Double" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
            <asp:Parameter Name="original_delivaryAddress" Type="String" />
            <asp:Parameter Name="original_locationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
