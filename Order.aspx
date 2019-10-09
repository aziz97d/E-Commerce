<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="E_Commerce.Order" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="hlOrderNew" runat="server" NavigateUrl="~/OrderNew.aspx">Add Order</asp:HyperLink>
    <br />
    <asp:GridView ID="dvOrder" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceOrder">
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Time" SortExpression="dateTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("dateTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number" SortExpression="number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("users") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total" SortExpression="total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivary Charge" SortExpression="delivaryCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("delivaryCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("delivaryCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Others Charge" SortExpression="othersCharge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("othersCharge") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("othersCharge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Method" SortExpression="paymentMethodId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("paymentMethodId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PaymentMehod") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order Details" ShowHeader="False">
                <ItemTemplate>
                    
                    <asp:Button ID="btnOdrDetails" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="btnOdrDetails_OnClick" CommandArgument='<%# Bind("id") %>' Text="Details" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orders] WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [number] = @original_number AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([delivaryCharge] = @original_delivaryCharge) OR ([delivaryCharge] IS NULL AND @original_delivaryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL))" InsertCommand="INSERT INTO [orders] ([dateTime], [number], [userId], [total], [delivaryCharge], [othersCharge], [paymentMethodId]) VALUES (@dateTime, @number, @userId, @total, @delivaryCharge, @othersCharge, @paymentMethodId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT o.[id], o.[dateTime], o.[number], o.[userId], o.[total], o.[delivaryCharge], o.[othersCharge], o.[paymentMethodId], pm.[name] as PaymentMehod, u.[name] as [users] FROM [orders] as o left join [paymentMethod] as pm on o.paymentMethodId=pm.id left join [users] as u on o.userId=u.id" UpdateCommand="UPDATE [orders] SET [dateTime] = @dateTime, [number] = @number, [userId] = @userId, [total] = @total, [delivaryCharge] = @delivaryCharge, [othersCharge] = @othersCharge, [paymentMethodId] = @paymentMethodId WHERE [id] = @original_id AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL)) AND [number] = @original_number AND [userId] = @original_userId AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([delivaryCharge] = @original_delivaryCharge) OR ([delivaryCharge] IS NULL AND @original_delivaryCharge IS NULL)) AND (([othersCharge] = @original_othersCharge) OR ([othersCharge] IS NULL AND @original_othersCharge IS NULL)) AND (([paymentMethodId] = @original_paymentMethodId) OR ([paymentMethodId] IS NULL AND @original_paymentMethodId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_number" Type="String" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Double" />
            <asp:Parameter Name="original_delivaryCharge" Type="Double" />
            <asp:Parameter Name="original_othersCharge" Type="Double" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Double" />
            <asp:Parameter Name="delivaryCharge" Type="Double" />
            <asp:Parameter Name="othersCharge" Type="Double" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="userId" Type="Int32" />
            <asp:Parameter Name="total" Type="Double" />
            <asp:Parameter Name="delivaryCharge" Type="Double" />
            <asp:Parameter Name="othersCharge" Type="Double" />
            <asp:Parameter Name="paymentMethodId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
            <asp:Parameter Name="original_number" Type="String" />
            <asp:Parameter Name="original_userId" Type="Int32" />
            <asp:Parameter Name="original_total" Type="Double" />
            <asp:Parameter Name="original_delivaryCharge" Type="Double" />
            <asp:Parameter Name="original_othersCharge" Type="Double" />
            <asp:Parameter Name="original_paymentMethodId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
