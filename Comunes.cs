using System;
using System.Net.Mail;
using System.Net;

using System;
using System.Data;
using System.Text;
using System.Web.UI;

//using System.Web.UI.WebControls;

//using System.Collections;
//using System.Collections.Generic;
//using CAID.Data;
//using System.Data;

namespace CAID_V2
{
    public class Comunes
    { 

        public static string RetornaCadena(string strstring)
        {
            string cadena = strstring;

            return strstring;
        }

        public static string EnviarCorreo(string ReciverMail, string subject, string body )
        {
            MailMessage msg = new MailMessage();
            /*
            msg.From = new MailAddress("M.CASTILLO@CAID.GOB.DO");
            msg.To.Add(ReciverMail);
            msg.Subject =  subject.ToString()+ " " + DateTime.Now.ToString();
            msg.Body = body.ToString();
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new NetworkCredential("melvi18@gmail.com", "greysy4321");
            //client.Credentials = new NetworkCredential("test@CAID.GOB.DO", "@123456");
            client.Timeout = 20000;
            */

            msg.From = new MailAddress("test@caid.gob.do");
            msg.To.Add(ReciverMail);
            msg.Subject = subject.ToString() + " " + DateTime.Now.ToString();
            msg.Body = body.ToString();
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.Host = "correo.caid.gob.do";
            client.Port = 25;
            //client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network; 
            client.Credentials = new NetworkCredential("test@caid.gob.do", "@123456");
            client.Timeout = 20000;

            try
            {
                client.Send(msg);
                System.Web.HttpContext.Current.Response.Redirect("http://caidsiges01:8082/forms/error.aspx", true);
                return "Mail has been successfully sent!";
            }
            catch (Exception ex)
            {
                return "Fail Has error" + ex.Message;
            }
            finally
            { 
                msg.Dispose();

            }
        }

        public static void ExportToExcel(Page page, DataTable dt, string excelFilePath = null)
        {
            try
            {
                string str1 = "attachment; filename=" + excelFilePath;
                page.Response.ClearContent();
                page.Response.AddHeader("content-disposition", str1);
                page.Response.ContentType = "application/vnd.ms-excel";
                page.Response.ContentEncoding = Encoding.UTF32;
                page.Response.Charset = "";
                string str2 = "";
                foreach (DataColumn column in (InternalDataCollectionBase)dt.Columns)
                {
                    page.Response.Write(str2 + column.ColumnName);
                    str2 = "\t";
                }
                page.Response.Write("\n");
                foreach (DataRow row in (InternalDataCollectionBase)dt.Rows)
                {
                    string str3 = "";
                    for (int index = 0; index < dt.Columns.Count; ++index)
                    {
                        page.Response.Write(str3 + row[index].ToString());
                        str3 = "\t";
                    }
                    page.Response.Write("\n");
                }
                page.Response.End();
            }
            catch (Exception ex)
            {
                throw new Exception("ExportToExcel: \n" + ex.Message);
            }
        }
    }

  

}