<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MotorClaim.aspx.cs" Inherits="GenericInsurance.MotorClaim" %>

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
                    <div>
                        <div class="col-md-6 form-line">

                            <h3>Policy Owner Details</h3>
                            <hr />
                            <div class="form-group">
                                <label for="customerId">Customer ID</label>
                                <input type="text" class="form-control" id="txtCustomerId" placeholder=" Enter Customer Id" runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="ddlPolicyholderType">Policyholder Type</label>
                                <asp:DropDownList ID="ddlPolicyholderType" class="form-control" runat="server" required>
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Private"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Corporate"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Email Address</label>
                                <input type="email" class="form-control" id="txtEmail" placeholder=" Enter Email id" runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="telephone">Mobile No.</label>
                                <input type="tel" class="form-control" id="txtPhone" placeholder=" Enter 10-digit mobile no." runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="Address">Address</label>
                                <input type="text" class="form-control" id="txtAddress" placeholder=" Enter Address." runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="City">City</label>
                                <input type="text" class="form-control" id="txtCity" placeholder=" Enter City" runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="State">State</label>
                                <input type="text" class="form-control" id="txtState" placeholder=" Enter State" runat="server" required />
                            </div>



                            <h3>Driver Details</h3>
                            <hr />
                            <div class="form-group">
                                <label for="Driver Name">Name</label>
                                <asp:TextBox ID="txtDriverName" runat="server" class="form-control" placeholder="Enter Driver Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="DriverAddress">Address</label>
                                <asp:TextBox ID="txtDriverAddress" runat="server" class="form-control" placeholder="Enter Address"></asp:TextBox>
                            </div>


                             <%--<h3>Pictures of Damaged Vehicle</h3>
                            <hr />
                            <h4 style="color: #fcc500;">All Attachments Must be In PDF or JPEG Format</h4>

                           <div class="form-group">
                                <label for="UploadPicture1">Upload Picture 1</label>
                                <asp:FileUpload ID="btnUpload1" runat="server" class="btn btn-default submit form-control" />
                            </div>
                            <div class="form-group">
                                <label for="UploadPicture2">Upload Picture 2</label>
                                <asp:FileUpload ID="btnUpload2" runat="server" class="btn btn-default submit form-control" />
                            </div>--%>
                        </div>

                        <div class="col-md-6">
                            <h3>Vehicle Details</h3>
                            <hr />

                            <div class="form-group">
                                <label for="PolicyNumber">Policy Number</label>
                                <input type="text" class="form-control" id="txtPolicyNumber" placeholder="Enter Policy Number" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="VehicleRegistrationNumber">Vehicle Registration Number</label>
                                <input type="text" class="form-control" id="txtVechicleRegNo" placeholder="Enter Vehicle Registration Number" runat="server" />
                            </div>
                            <h3>Details of Incident</h3>
                            <hr />
                            <div class="form-group">
                                <label for="DateofIncident">Date of Incident</label>
                                <input type="date" class="form-control" id="txDateofIncident" placeholder="Enter Date of Incident" runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="TimeofIncident">Time of Incident</label>
                                <input type="time" class="form-control" id="txtTimeofIncident" placeholder="Enter Time of Incident" runat="server" required />
                            </div>
                            <div class="form-group">
                                <label for="DetailsofIncident">Details of Incident</label>
                                <textarea class="form-control" id="txtDetailsofIncident" placeholder="Enter Details of Incident" required rows="3" runat="server"></textarea>
                            </div>

                           <div class="row">
                                <div class="col-md-12">


                                    <div class="col-md-4">
                                        <h3>Driver side</h3>
                                        <hr />
                                        <asp:CheckBoxList ID="chkDriverSide" runat="server">
                                            <asp:ListItem Value="1" Text="Front wing"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Front door"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Rear door"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Rear wing"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>Passenger side</h3>
                                        <hr />
                                        <asp:CheckBoxList ID="chkPassengerSide" runat="server">
                                            <asp:ListItem Value="1" Text="Front wing"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Front door"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Rear door"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Rear wing"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>Car centre</h3>
                                        <hr />
                                        <asp:CheckBoxList ID="chkCarCentre" runat="server">
                                            <asp:ListItem Value="1" Text="Front"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Bonnet"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Front window/screen"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Roof"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Rear window/screen"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Boot"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Rear"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="WitnessDetails1">Witness 1 Name and Contact Details (Tel/Email etc)</label>
                                <textarea class="form-control" id="txtWitnessDetails1" placeholder="Enter Details of Witness Details" required rows="3" cols="3" runat="server"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="WitnessDetails2">Witness 2 Name and Contact Details (Tel/Email etc)</label>
                                <textarea class="form-control" id="txtWitnessDetails2" placeholder="Enter Details of Witness Details" required rows="3" cols="3" runat="server"></textarea>
                            </div>
                            <div>
                                <asp:Button ID="btnOrder" runat="server" Text="Proceed" class="btn btn-default submit" OnClick="btnOrder_Click" Style="height: 37px" />
                                <%--<asp:Button ID="btnTry" runat="server" Text="TryModal" OnClick="btnTry_Click" />--%>
                                <%--<button type="submit" id="btnSubmit" class="btn btn-default submit" runat="server" onclick="btnSubmit_Click"><i class="fa fa-paper-plane" aria-hidden="true"></i>Order</button>--%>
                            </div>

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