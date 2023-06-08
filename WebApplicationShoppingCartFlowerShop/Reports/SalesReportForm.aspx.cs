using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationShoppingCartFlowerShop.Reports
{
    public partial class SalesReportForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            DataSetReport ds = new DataSetReport();
            DataSetReportTableAdapters.DataTableSalesTableAdapter ta = new DataSetReportTableAdapters.DataTableSalesTableAdapter();
            ta.Fill(ds.DataTableSales);
            CrystalReportSales cr1 = new CrystalReportSales();
            cr1.Load(Server.MapPath("~/Reports/CrystalReportSales.rpt"));
            //cr1.SetDatabaseLogon("xxxx", "yyyy");
            cr1.SetDataSource(ds.Tables["DataTableSales"]);
            CrystalReportViewer1.ReportSource = cr1;
            cr1.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Sales");
        }
    }
}