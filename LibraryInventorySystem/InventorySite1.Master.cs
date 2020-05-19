using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryInventorySystem
{
    public partial class InventorySite1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view_books_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbook.aspx");
        }

        protected void user_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void sign_up_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void book_inventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookinventory.aspx");
        }
    }
}