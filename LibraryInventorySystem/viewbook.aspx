<%@ Page Title="" Language="C#" MasterPageFile="~/InventorySite1.Master" AutoEventWireup="true" CodeBehind="viewbook.aspx.cs" Inherits="LibraryInventorySystem.viewbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
              <div class="row">

                <div class="col-sm-12">*
                    <center>
                        <h3>
                        Book Inventory List</h3>
                    </center>

                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="gridview_bookinventory" 
                            runat="server"  AutoGenerateColumns="false" DataKeyNames="book_isbn">
                            <Columns>
                                <asp:BoundField DataField="book_isbn" HeaderText="ID" ReadOnly="True" SortExpression="book_isbn">
                                 <ControlStyle Font-Bold="True" />
                                  <ItemStyle Font-Bold="True" />
                                  </asp:BoundField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Lable1" runat="server"   Text='<%#  Eval("book_name") %>' 
                                                        Font-Size="X-Large" Font-Bold="True"></asp:Label> 
                                                        </div>
                                                    </div>

                                                     <div class="row">
                                                        <div class="col-12">
                                                                            <span>Author - </span>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                            &nbsp;| <span>Language -<span>&nbsp;</span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                            </span>
                                                        </div>
                                                    </div>

                                                     <div class="row">
                                                        <div class="col-12">
                                                                             Publisher -
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                            &nbsp;| Publish Date -
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                            &nbsp;| Pages -
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                            &nbsp;| Edition -
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                     <div class="row">
                                                        <div class="col-12">
                                                            Cost -
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                            &nbsp;
                                                        </div>
                                                    </div>
                                                 
                                               </div>
                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%#  Eval("book_img_link") %>'/>                                                   
                                                  </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                  </div>
               </div>
            </div>
         </div>
                    </div>
                  </div>
                  <center>
                      <a href="home.aspx"><< Back to Home</a><span class="clearfix"></span><br />
                  </center>
                  </div>
                </div>


</asp:Content>
