using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using CAID_V2;
using System.Text;

namespace CAID_V2
{
  

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            this.Session.Add("xHTML_Options", (object)"");
            this.Session.Add("CURRENTUSR_ID", (object)string.Empty);

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //string servidor = HttpContext.Current.Request.Url.AbsoluteUri;
            //HttpUtility.UrlEncode("locahost");
            Exception ex = Server.GetLastError();
            ErrorLogService.LogError(ex);

        }
        //common service to be used for logging errors
        public static class ErrorLogService
        {
             
            public static void LogError(Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                //sb.Append("< !DOCTYPE html >");
                //sb.Append("< html >");
                //sb.Append("< head >");
                //sb.Append("</ head >");
                //sb.Append("< body>");
                sb.Append("<strong><h5>PAGINA: </h5></strong>" + HttpContext.Current.Request.Url.AbsoluteUri + " <br/>");
                sb.Append(" <br/>");
                sb.Append("<strong><h5>ERROR: </h5></strong>" + ex.Message.ToString() + " <br/>");
                sb.Append(" <br/>");
                sb.Append("<strong><h5>EXCEPCION: </h5></strong>" + ex.InnerException.ToString() + " <br/>");
                //sb.Append("</ body >");
                //sb.Append("</ html >");
                //"PAGINA: " + HttpContext.Current.Request.Url.AbsoluteUri + "; ERROR: " + ex.Message.ToString() + "; EXCEPCION: " + ex.InnerException.ToString()
               Comunes.EnviarCorreo("m.castillo@caid.gob.do,r.diaz@caid.gob.do", "ERROR SIGES", sb.ToString());
            }
        }



        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}