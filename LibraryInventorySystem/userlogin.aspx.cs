using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


namespace LibraryInventorySystem
{
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // MySqlCommand cmd = new MySqlCommand("select * from member_master where member_id='" + txtuserid.Text.Trim() + "' AND password='" + txtpassword.Text.Trim() + "'", con);
                MySqlCommand cmd = new MySqlCommand("select * from sign_up where user_id='" + txtuserid.Text.Trim() + "' AND password='" + txtpassword.Text.Trim() + "'", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                       // Response.Write("<script>alert('" + dr.GetValue(5).ToString() + "');</script>");
                         Response.Write("<script>alert('Login Successfully');</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }


        /*  protected void btn_login_Click(object sender, EventArgs e)
          {
              Response.Write("<script>alert('Button Click');</script>");
          } */


              
    }
}