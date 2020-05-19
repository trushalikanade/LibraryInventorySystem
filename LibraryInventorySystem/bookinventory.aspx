<%@ Page Title="" Language="C#" MasterPageFile="~/InventorySite1.Master" AutoEventWireup="true" CodeBehind="bookinventory.aspx.cs" Inherits="LibraryInventorySystem.bookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <!--  
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
    </script>
      -->
    <script>
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                            <img id="imgview" height="150px" width="100px" src="book_inventory/books1.png" />
                        </center>
                     </div>
                  </div>
                  
                   <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1"  runat="server" />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label>Book ISBN</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtbookisbn" runat="server" placeholder="ISBN"></asp:TextBox>
                               <asp:Button class="form-control btn btn-primary" ID="btn_go" runat="server" Text="GO" OnClick="btn_go_Click"  />    
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Book Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtbookname" runat="server" placeholder="Book Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>Language</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="drplangauge" runat="server">
                               <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="English" Value="English" />
                              <asp:ListItem Text="Hindi" Value="Hindi" />
                              <asp:ListItem Text="Marathi" Value="Marathi" />
                              <asp:ListItem Text="French" Value="French" />
                              <asp:ListItem Text="German" Value="German" />
                              <asp:ListItem Text="Urdu" Value="Urdu" />
                           </asp:DropDownList>
                        </div>

                        <label>Publisher Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="drppublishername" runat="server">
                               <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text=" Hachette Livre" Value="Hachette Livre" />
                              <asp:ListItem Text=" Reed Elsevier" Value="Reed Elsevier" />
                               <asp:ListItem Text="Random House" Value="Random House" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Author Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="drpauthorname" runat="server">
                               <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Joseph Murphy" Value="Joseph Murphy" />
                              <asp:ListItem Text="William Shakespeare" Value="William Shakespeare" />
                              <asp:ListItem Text="James Joyce" Value="James Joyce" />
                              <asp:ListItem Text="John" Value="John" />
                           </asp:DropDownList>
                        </div>
                        <label>Publish Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtdate" runat="server" placeholder="Date"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label>Edition</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtedition" runat="server" placeholder="Edition"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Book Cost</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtcost" runat="server" placeholder="Book Cost" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <label>Pages</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtpages" runat="server" placeholder="Pages"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  

                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btn_add" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btn_add_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btn_update" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btn_update_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btn_delete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btn_delete_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="home.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                           <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
                       </div>
                   </div>
                   <br />
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="gridview_bookinventory" runat="server" ></asp:GridView>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

    </div>


</asp:Content>
