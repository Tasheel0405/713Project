using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationShoppingCartFlowerShop.ShopUser
{
    public partial class CustomerTransactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDSOrder.SelectParameters["CustID"].DefaultValue = Session["CustID"].ToString();
            Label2.Text = Session["CustName"].ToString();
        }
    }
}