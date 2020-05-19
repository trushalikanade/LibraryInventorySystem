<%@ Page Title="" Language="C#" MasterPageFile="~/InventorySite1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="LibraryInventorySystem.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Imgs/generaluser.png" width="150px" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtuserid" runat="server" placeholder="User Id"></asp:TextBox>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtpassword" runat="server" placeholder="Password" 
                                        TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click"  />    
                                </div>
                                <div class="form-group">
                                   <a href="signup.aspx"><input id="btn_signup" class="btn btn-info btn-block btn-lg" type="button" value="Sign Up" /></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <a href="home.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>


</asp:Content>
