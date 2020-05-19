<%@ Page Title="" Language="C#" MasterPageFile="~/InventorySite1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="LibraryInventorySystem.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <section>
         <img src="imgs/home-bg.jpg" class="img-fluid" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/digital-inventory.png"/>
                  <h4>Book Inventory</h4>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/search-online.png"/>
                  <h4>Search Books</h4>
                 </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/defaulters-list.png"/>
                  <h4>Defaulter List</h4>
               </center>
            </div>
         </div>
      </div>
   </section>

   <section>
      <img src="imgs/in-homepage-banner.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Process</h2>
                  <p><b>We have a Simple 3 Step Process</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/sign-up.png" />
                  <h4>Sign Up</h4>
                  <p class="text-center">If you are not registered then sign up our website.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/search-online.png"/>
                  <h4>Search Books</h4>
                  <p class="text-center">Search the books which is available in the library. </p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/library.png"/>
                  <h4>Visit Us</h4>
                  <p class="text-center">Visit our website.</p>
               </center>
            </div>
         </div>

          
        </div>
    </section>

</asp:Content>
