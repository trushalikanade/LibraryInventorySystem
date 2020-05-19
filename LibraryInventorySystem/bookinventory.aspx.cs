using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO;
namespace LibraryInventorySystem
{
    public partial class bookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // check mysql connection
                bindData();
            }

        }

        protected void btn_go_Click(object sender, EventArgs e)
        {
            getBookByISBN();
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                Response.Write("<script>alert('Book already exist,try some other Book')</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            updateBookByISBN();
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            deleteBookByISBN();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("SELECT * from book_inventory where book_isbn='" + txtsearch.Text.Trim() + "' OR book_name='" + txtsearch.Text.Trim() + "';", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gridview_bookinventory.DataSource = dt;
                gridview_bookinventory.DataBind();
              
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getBookByISBN()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("SELECT * from book_inventory where book_isbn='" + txtbookisbn.Text.Trim() + "'", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtbookname.Text = dt.Rows[0]["book_name"].ToString();
                    txtdate.Text = dt.Rows[0]["publish_date"].ToString();
                    txtedition.Text = dt.Rows[0]["edition"].ToString();
                    txtcost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    txtpages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    
                    drplangauge.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    drppublishername.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    drpauthorname.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkBookExists()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("SELECT * from book_inventory where book_isbn='" + txtbookisbn.Text.Trim() + "' OR book_name='" + txtbookname.Text.Trim() + "';", con);
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

        void updateBookByISBN()
        {
            if (checkBookExists())
            {
                try
                {
                    
                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    MySqlConnection con = new MySqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    MySqlCommand cmd = new MySqlCommand("UPDATE book_inventory set book_name=@book_name, language=@language, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_img_link=@book_img_link where book_isbn='" + txtbookisbn.Text.Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@book_name", txtbookname.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", drplangauge.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@author_name", drpauthorname.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", drppublishername.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", txtdate.Text.Trim());          
                    cmd.Parameters.AddWithValue("@edition", txtedition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", txtcost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", txtpages.Text.Trim());
                    
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearform();
                    bindData();
                    Response.Write("<script>alert('Book updated successfully');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member Id');</script>");
            }

        }

        void deleteBookByISBN()
        {
            if (checkBookExists())
            {
                try
                {
                    MySqlConnection con = new MySqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("Delete from book_inventory where book_isbn = '" + txtbookisbn.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book deleted successfully');</script>");
                    clearform();
                    bindData();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member Id');</script>");
            }

        }


        void addNewBook()
        {
            try
            {
                
                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("INSERT INTO book_inventory(book_isbn,book_name,language,author_name,publisher_name,publish_date,edition,book_cost,no_of_pages,book_img_link) values(@book_isbn,@book_name,@language,@author_name,@publisher_name,@publish_date,@edition,@book_cost,@no_of_pages,@book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_isbn", txtbookisbn.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtbookname.Text.Trim());
                cmd.Parameters.AddWithValue("@language", drplangauge.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author_name", drpauthorname.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", drppublishername.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtdate.Text.Trim());                
                cmd.Parameters.AddWithValue("@edition", txtedition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txtcost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txtpages.Text.Trim());
               
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                clearform();
                Response.Write("<script>alert('Book added successfully.');</script>");
                bindData();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void bindData()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlCommand cmd = new MySqlCommand("SELECT * from book_inventory", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    gridview_bookinventory.DataSource = dt;
                    gridview_bookinventory.DataBind();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void clearform()
        {
            txtbookisbn.Text = "";
            txtbookname.Text = "";
            drplangauge.Items.Clear();
            drpauthorname.Items.Clear();
            drppublishername.Items.Clear();
            txtdate.Text = "";
            txtedition.Text = "";
            txtcost.Text = "";
            txtpages.Text = "";
        }

        
    }
}