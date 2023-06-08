using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace WebApplicationShoppingCartFlowerShop.ShopUser
{
    public partial class FlowerShop : System.Web.UI.Page
    {
        List<CartItem> cartList = new List<CartItem>();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = DateTime.Now.ToShortDateString();
            SqlDSCustomer.SelectParameters["email"].DefaultValue = User.Identity.Name.ToString();
            DetailsViewCustomer.DataBind();
            Session["CustID"] = DetailsViewCustomer.Rows[0].Cells[1].Text;
            Session["CustName"] = DetailsViewCustomer.Rows[1].Cells[1].Text + " " + DetailsViewCustomer.Rows[2].Cells[1].Text;
            if (!Page.IsPostBack)
                Session["Cart"] = cartList;
            else
                cartList = (List<CartItem>)Session["Cart"];
        }

        protected void GridViewFlowers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowindex=0;
            if (e.CommandName == "btnClick")
            {
                rowindex = Convert.ToInt32(e.CommandArgument);
                CartItem ci = new CartItem();
                ci.ID = Convert.ToInt16(GridViewFlowers.Rows[rowindex].Cells[0].Text);
                ci.Name= GridViewFlowers.Rows[rowindex].Cells[1].Text;
                ci.Price = Decimal.Parse(GridViewFlowers.Rows[rowindex].Cells[2].Text, NumberStyles.Currency);
                DropDownList ddlQty = (DropDownList)GridViewFlowers.Rows[rowindex].FindControl("ddlQuantity");
                ci.Quantity = Convert.ToInt16(ddlQty.SelectedValue);              
                ci.SubTotal = ci.GetSubTotal();
                cartList.Add(ci);
                Session["Cart"] = cartList;
                //lblAmountDue.Text = String.Format("{0:C2}", GetCartTotal());
                lblAmountDue.Text = GetCartTotal().ToString();
                UpdateCart();
            }                               
        }
        protected void UpdateCart()
        {
            gridShopCart.DataSource = cartList;
            gridShopCart.DataBind();
            for (int i = 0; i < gridShopCart.Rows.Count; i++) //for the currency symbol
            {
                gridShopCart.Rows[i].Cells[3].Text = String.Format("{0:C2}", Convert.ToDecimal(gridShopCart.Rows[i].Cells[3].Text));
                gridShopCart.Rows[i].Cells[5].Text = String.Format("{0:C2}", Convert.ToDecimal(gridShopCart.Rows[i].Cells[5].Text));
            }
        }
        protected decimal GetCartTotal()
        {
            Decimal total = 0;
            for (int i = 0; i < cartList.Count; i++)
            {
                total += cartList[i].SubTotal;
            }
            return total;
        }
        protected void gridShopCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cartList.RemoveAt(e.RowIndex);
            UpdateCart();
            lblAmountDue.Text = String.Format("{0:C2}", GetCartTotal());
        }

        protected void btnConfirmSale_Click(object sender, EventArgs e)
        {
            SqlDSRecordSale.InsertParameters["CustID"].DefaultValue = DetailsViewCustomer.Rows[0].Cells[1].Text;
            SqlDSRecordSale.Insert();
        }

        protected void SqlDSRecordSale_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string OrderNum = e.Command.Parameters["@OrderID"].Value.ToString();
            for (int i = 0; i < gridShopCart.Rows.Count; i++)
            {
                SqlDSOrderDetail.InsertParameters["OrderID"].DefaultValue = OrderNum;
                SqlDSOrderDetail.InsertParameters["ProdID"].DefaultValue = gridShopCart.Rows[i].Cells[1].Text;
                SqlDSOrderDetail.InsertParameters["Description"].DefaultValue = gridShopCart.Rows[i].Cells[2].Text;
                SqlDSOrderDetail.InsertParameters["UnitPrice"].DefaultValue = Decimal.Parse(gridShopCart.Rows[i].Cells[3].Text,NumberStyles.Currency).ToString();
                SqlDSOrderDetail.InsertParameters["Qty"].DefaultValue = gridShopCart.Rows[i].Cells[4].Text;
                SqlDSOrderDetail.InsertParameters["Sub"].DefaultValue = (Decimal.Parse(gridShopCart.Rows[i].Cells[5].Text, NumberStyles.Currency)).ToString();
                SqlDSOrderDetail.Insert();
                //lblDate.Text = Decimal.Parse(gridShopCart.Rows[i].Cells[3].Text,NumberStyles.Currency).ToString();
            }
        }
    }
}