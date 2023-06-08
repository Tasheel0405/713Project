using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationShoppingCartFlowerShop.ShopUser
{
    public class CartItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal SubTotal { get; set; }
        public decimal GetSubTotal()
        {
            return Price * Quantity;
        }
    }
}