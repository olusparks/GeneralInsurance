<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Policy.aspx.cs" Inherits="GenericInsurance.Policy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/custom.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Teko:400,700" rel="stylesheet" />
    <meta name="description" content="The description of my page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

     <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        function showModal() {
            var options = {
                backdrop: "static",
                keyboard: false,
                show: true,
                remote: false
            };
            $("#myModal").modal(options);
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <section id="contact">
            <div class="section-content">
                <h1 class="section-header"><span class="content-header wow fadeIn " data-wow-delay="0.2s" data-wow-duration="2s">Mutual Benefits Assurance Plc</span></h1>
            </div>
            <div class="contact-section">
                <div class="container">
                    <div class="col-md-6 form-line">

                        <div class="form-group">
                            <label for="customerId">Policy Name</label>
                            <asp:TextBox ID="txtPolicyName" runat="server" class="form-control" placeholder=" Enter Policy Name"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="txtCustomerId" placeholder=" Enter Customer Id" runat="server" required />--%>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Contact ID</label>
                            <asp:TextBox ID="txtContactId" class="form-control" runat="server" placeholder=" Enter Id"></asp:TextBox>
                            <%--<input type="email" class="form-control" id="txtEmail" placeholder=" Enter Email id" runat="server" required />--%>
                        </div>

                        <div class="form-group">
                            <label for="ddlPolicyCategory">Policy Category</label>
                            <asp:DropDownList ID="ddlPolicyCategory" class="form-control" runat="server" required>
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                                <asp:ListItem Value="1" Text="Private"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Corporate"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%--<div class="form-group">
                                <label for="PolicyNo">Policy No.</label>
                                <asp:TextBox ID="txtPolicyNo" class="form-control" runat="server" placeholder="Policy No"></asp:TextBox>
                                <input type="tel" class="form-control" id="polic" placeholder=" Enter 10-digit mobile no." runat="server" required />
                            </div>--%>
                        <div class="form-group">
                            <label for="Carrier">Carrier</label>
                            <asp:TextBox ID="txtCarrier" class="form-control" runat="server" placeholder="Enter Caarier"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="txtAddress" placeholder=" Enter Address." runat="server" required />--%>
                        </div>

                        <div class="form-group">
                            <label for="ddlPolicyStatus">Policy Status</label>
                            <asp:DropDownList ID="ddlPolicyStatus" class="form-control" runat="server" required>
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                                <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Inactive"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ddlCoverage">Coverage</label>
                            <asp:DropDownList ID="ddlCoverage" class="form-control" runat="server" required>
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                                <asp:ListItem Value="1" Text="Life Insurance"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Travel Insurance"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Motor Insurance"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Marine Insurance"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Drone Insurance"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="EffectiveDate">Effective Date</label>
                            <asp:TextBox ID="txtEffectiveDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="txtPolicyNumber" placeholder="Enter Policy Number" runat="server" />--%>
                        </div>
                        <div class="form-group">
                            <label for="RenewalDate">Renewal Date</label>
                            <asp:TextBox ID="txtRenewalDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="txtVechicleRegNo" placeholder="Enter Vehicle Registration Number" runat="server" />--%>
                        </div>

                        <div class="form-group">
                            <label for="AnnualPremium">Annual Premium</label>
                            <asp:TextBox ID="txtAnnualPremium" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <%--<input type="date" class="form-control" id="txDateofIncident" placeholder="Enter Date of Incident" runat="server" required />--%>
                        </div>
                        <div class="form-group">
                            <label for="MonthlyPremium">Monthly Premium</label>
                            <asp:TextBox ID="txtMonthlyPremium" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <%--<input type="date" class="form-control" id="txDateofIncident" placeholder="Enter Date of Incident" runat="server" required />--%>
                        </div>
                        <div class="form-group">
                            <label for="Lives">Lives</label>
                            <asp:TextBox ID="txtLives" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <%--<textarea class="form-control" id="txtLives" placeholder="Enter Number of Lives" required rows="3" runat="server"></textarea>--%>
                        </div>
                        <div>
                            <asp:Button ID="btnPolicy" runat="server" Text="Create Policy" class="btn btn-default submit" Style="height: 37px" OnClick="btnPolicy_Click" />
                        </div>
                    </div>


                </div>
            </div>
        </section>

        <!-- Modal Success Popup -->
        <div class="modal fade success-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="myModal">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title text-center" id="myModalLabel">Mutual Benefits Assurance Plc</h4>
                    </div>
                    <div class="modal-body text-center">
                        <p class="lead"><asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true"></asp:Label></p>
                    </div>

                </div>
            </div>
        </div>
    </form>
  
   
</body>
</html>