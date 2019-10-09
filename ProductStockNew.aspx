<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductStockNew.aspx.cs" Inherits="E_Commerce.ProductStockNew" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="dvProductStock" runat="server" AutoGenerateRows="False" DataKeyNames="productId" DataSourceID="SqlDataSource1" DefaultMode="Insert" >
        <Fields>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" SelectedValue='<%# Bind("productId") %>' DataSourceID="SqlDataSourceProduct" DataTextField="name" DataValueField="id" Height="19px" Width="141px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="In Qty" SortExpression="inQty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("inQty") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("inQty") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("inQty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Out Qty" SortExpression="outQty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("outQty") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("outQty") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("outQty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
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
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("dateTime") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [produtStock] WHERE [productId] = @original_productId AND (([inQty] = @original_inQty) OR ([inQty] IS NULL AND @original_inQty IS NULL)) AND (([outQty] = @original_outQty) OR ([outQty] IS NULL AND @original_outQty IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL))" InsertCommand="INSERT INTO [produtStock] ([productId], [inQty], [outQty], [remarks], [dateTime]) VALUES (@productId, @inQty, @outQty, @remarks, @dateTime)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [productId], [inQty], [outQty], [remarks], [dateTime] FROM [produtStock]" UpdateCommand="UPDATE [produtStock] SET [inQty] = @inQty, [outQty] = @outQty, [remarks] = @remarks, [dateTime] = @dateTime WHERE [productId] = @original_productId AND (([inQty] = @original_inQty) OR ([inQty] IS NULL AND @original_inQty IS NULL)) AND (([outQty] = @original_outQty) OR ([outQty] IS NULL AND @original_outQty IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([dateTime] = @original_dateTime) OR ([dateTime] IS NULL AND @original_dateTime IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_inQty" Type="Double" />
            <asp:Parameter Name="original_outQty" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="inQty" Type="Double" />
            <asp:Parameter Name="outQty" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="inQty" Type="Double" />
            <asp:Parameter Name="outQty" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="dateTime" Type="DateTime" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_inQty" Type="Double" />
            <asp:Parameter Name="original_outQty" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
            <asp:Parameter Name="original_dateTime" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
