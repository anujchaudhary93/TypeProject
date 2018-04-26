using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TypePro.Controller
{
    public class TestController : ApiController
    {
        public String Get() {
            return  " Name 2 ";
        }
        [Route("api/test/names")]
        public String GetName()
        {
            String jsonObj = "{name : Anuj , class : Exclusive }";
            return jsonObj;
        }
    }
}
