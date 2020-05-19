<%@ Page Title="" Language="C#" MasterPageFile="~/InventorySite1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="LibraryInventorySystem.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>User Sign Up</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtfullname" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtdate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtcontactno" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtemail" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                      </div>

                    <div class="row">
                     <div class="col">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtfulladdress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                   </div>

                   <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-6">
                        <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtuserid" runat="server" placeholder="User Id"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtpassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                         <div class="form-group">
                             <asp:Button class="btn btn-success btn-block btn-lg" ID="sign_up" runat="server" Text="Sign Up" OnClick="sign_up_Click"/>    
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
