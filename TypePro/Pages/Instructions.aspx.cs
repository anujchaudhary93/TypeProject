using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TypePro.Pages
{
    public partial class Instructions : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypingPassage.aspx?rollno=1000&name=Anuj&time=10&rest=1");
        }
    }
}