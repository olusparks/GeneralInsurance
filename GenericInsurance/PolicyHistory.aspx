<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyHistory.aspx.cs" Inherits="GenericInsurance.PolicyHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Claims History</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GrdPolicyHistory" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="1" Width="100%" CssClass="table table-hover table-striped">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("PolicyID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Policy No">
                    <ItemTemplate>
                        <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Bind("PolicyNo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <asp:Label ID="lblPolicyCategory" runat="server" Text='<%# Bind("PolicyCategoryName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="6%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="lblPolicyStatus" runat="server" Text='<%# Bind("PolicyStatusName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coverage">
                    <ItemTemplate>
                        <asp:Label ID="lblCoverage" runat="server" Text='<%# Bind("CoverageName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Effective Date">
                    <ItemTemplate>
                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="12%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Renewal Date">
                    <ItemTemplate>
                        <asp:Label ID="lblRenewalDate" runat="server" Text='<%# Bind("RenewalDate") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="12%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ann. Premium">
                    <ItemTemplate>
                        <asp:Label ID="lblAnnualPremium" runat="server" Text='<%# Bind("AnnualPremium") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                </asp:TemplateField>
            </Columns>

            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#000066" HorizontalAlign="Left" BackColor="White" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

        </asp:GridView>
    </form>
</body>
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="Scripts/jquery-1.9.1.intellisense.js"></script>
</html>

