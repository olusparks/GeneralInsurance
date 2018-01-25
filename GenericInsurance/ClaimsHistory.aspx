<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimsHistory.aspx.cs" Inherits="GenericInsurance.ClaimsHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Claims History</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GrdClaimsHistory" runat="server" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="1" Width="100%" CssClass="table table-hover table-striped">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Policy No">
                    <ItemTemplate>
                        <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Bind("PolicyNo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="V.Reg No">
                    <ItemTemplate>
                        <asp:Label ID="lblVehicleRegNo" runat="server" Text='<%# Bind("VehicleRegNo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="6%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmailAddress" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone No">
                    <ItemTemplate>
                        <asp:Label ID="lblPhoneNo" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time of Incident">
                    <ItemTemplate>
                        <asp:Label ID="lblTimeOfIncident" runat="server" Text='<%# Bind("TimeOfIncident") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="12%" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Drv. Name">
                    <ItemTemplate>
                        <asp:Label ID="lblDriverName" runat="server" Text='<%# Bind("DriverName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="8%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver Address">
                    <ItemTemplate>
                        <asp:Label ID="lblDriverAddress" runat="server" Text='<%# Bind("DriverAddress") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Details of Incident">
                    <ItemTemplate>
                        <asp:Label ID="lblDetailsOfIncident" runat="server" Text='<%# Bind("DetailsOfIncident") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Witness 1">
                    <ItemTemplate>
                        <asp:Label ID="lblWitness1Details" runat="server" Text='<%# Bind("Witness1Details") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Witness 2">
                    <ItemTemplate>
                        <asp:Label ID="lblWitness2Details" runat="server" Text='<%# Bind("Witness2Details") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="10%" />
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