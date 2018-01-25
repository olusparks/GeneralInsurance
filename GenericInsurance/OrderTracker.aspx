<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderTracker.aspx.cs" Inherits="GenericInsurance.OrderTracker" %>

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
                            <div class="form-group">
                                <label for="exampleInputUsername">Your name</label>
                                <input type="text" class="form-control" id="txtName" placeholder=" Enter Name" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Email Address</label>
                                <input type="email" class="form-control" id="txtEmail" placeholder=" Enter Email id" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="telephone">Mobile No.</label>
                                <input type="tel" class="form-control" id="txtPhone" placeholder=" Enter 10-digit mobile no." runat="server" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="telephone">Product Name</label>
                                <asp:DropDownList ID="ddlProductName" class="form-control" runat="server" required>
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Life Insurance"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Motor Insurance"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Marine Insurance"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Home Insurance"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="telephone">Price</label>
                                <input type="tel" class="form-control" id="txtPrice" placeholder="Enter Price" onkeyup="GetTotal()" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="telephone">Quantity</label>
                                <input type="tel" class="form-control" id="txtQuantity" placeholder="Enter Quantity" onkeyup="GetTotal()" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="telephone">Total</label>
                                <input type="tel" class="form-control" id="txtTotal" placeholder="Total" runat="server" disabled="disabled" />
                            </div>
                            <%-- <div class="form-group">
                                <label for="description">Message</label>
                                <textarea class="form-control" id="description" placeholder="Enter Your Message"></textarea>
                            </div>--%>
                            <div>
                                <asp:Button ID="btnOrder" runat="server" Text="Order" class="btn btn-default submit" OnClick="btnSubmit_Click" />
                                <%--<button type="submit" id="btnSubmit" class="btn btn-default submit" runat="server" onclick="btnSubmit_Click"><i class="fa fa-paper-plane" aria-hidden="true"></i>Order</button>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Success Popup -->
            <div class="modal fade success-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="myModal">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title text-center" id="myModalLabel">Mutual Benefits Assurance Plc</h4>
                        </div>
                        <div class="modal-body text-center">
                            <p class="lead">
                                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label></p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <%-- <div>
            <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>--%>
    </form>

    <!-- Modal Success Popup -->
    <div class="modal fade success-popup" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="myModal">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title text-center" id="myModalLabel">Mutual Benefit</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="lead">
                        <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label></p>
                </div>

            </div>
        </div>
    </div>

    <script>
        function GetTotal() {

            var txtFirstNumberValue = document.getElementById('txtPrice').value;
            var txtSecondNumberValue = document.getElementById('txtQuantity').value;
            var result = parseInt(txtFirstNumberValue) * parseInt(txtSecondNumberValue);
            if (!isNaN(result)) {
                document.getElementById('txtTotal').value = result;
            }
            //var price = parseInt(document.getElementById("txtPrice"));
            //var quantity = parseInt(document.getElementById("txtQuantity"));
            //if (price !== "" && quantity !== "")
            //{
            //    var total = price * quantity
            //    document.getElementById("txtTotal").innerHTML = total;
            //} else {
            //    alert("Please total must be calculated")
            //}


        }
    </script>
</body>

</html>