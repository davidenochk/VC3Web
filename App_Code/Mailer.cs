using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for Mailer
/// </summary>
public class Mailer
{
    public Mailer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public bool sendMail(string to, string cc, string bcc, string subject, string body)
    {
        try
        {
            SmtpClient client = new SmtpClient();
            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage("info@c3victory.in", to, subject, body);
            message.Bcc.Add(bcc);
            message.CC.Add(cc);
            message.IsBodyHtml = true;
            client.Send(message);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}