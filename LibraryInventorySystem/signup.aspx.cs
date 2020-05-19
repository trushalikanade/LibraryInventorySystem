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
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sign_up_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {

                Response.Write("<script>alert('User Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                signUpNewMember();
            }

        }

        bool checkMemberExists()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("SELECT * from sign_up where user_id='" + txtuserid.Text.Trim() + "';", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void signUpNewMember()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("INSERT INTO sign_up(full_name,dob,contact_no,email,full_address,user_id,password) values(@full_name,@dob,@contact_no,@email,@full_address,@user_id,@password)", con);
                cmd.Parameters.AddWithValue("@full_name", txtfullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtdate.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtcontactno.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtfulladdress.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", txtuserid.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtpassword.Text.Trim());         
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                clearform();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearform()
        {
            txtfullname.Text = "";
            txtdate.Text = "";
            txtcontactno.Text = "";
            txtdate.Text = "";
            txtemail.Text = "";
            txtfulladdress.Text = "";
            txtuserid.Text = "";
            txtpassword.Text = "";
        }

    }
}