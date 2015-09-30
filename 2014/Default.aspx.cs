using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Sending a mail
        sendMail("reynoldson.k@gmail.com", "davidenoch@outlook.com", "davidenoch@outlook.com", "Feedback - Influence Conference 2014", "<table style=\"background-color:#f9f9f9;width:100%;color:#000;\"><tr><td>Personal Details</td></tr><tr><td>Name : " + name.Text + "</td></tr><tr><td></td></tr><tr><td>Email : " + email.Text + "</td></tr><tr><td>Phone : " + phone.Text + "</td></tr><tr><td>Tell us about your experience : " + message.Text + "</td></tr><tr><td><br/><br/>\"<strong>Is There Not A Cause?</strong>!\"<br/><br/></td></tr><tr><td>Regards<br/>C3 Victory Secunderabad</td></tr></table>");
    }
    public bool sendMail(string to, string cc, string bcc, string subject, string body)
    {
        try
        {
            SmtpClient client = new SmtpClient();
            //string messageText = "<table width=\"100%\" style=\"background-color:#132532;padding:20px;font-family:'century gothic';color:white;border-radius:10px;padding:20px;font-family:'Century Gothic'\"><tr align=\"left\"><td>Dear " + name.Text + "<br /><br />Thank you for your interest to be part of Influence Conference 2013. We have taken note of your contact details. We will be contacting you in sometime and help you register for the conference.<br /><br />\"Be The Light!\"<br /> <br /><b>Registration Team</b><br />Influence Conference<br />       <br /> </td>     </tr><tr><td style=\"height:70px;text-align:left;\"><img src=\"http://influenceconference.in/graphics/circleLogoSmall.png\" height=\"70px\" /></td>  </tr><tr><td><b>Vicky Michael</b><br />(+91 800-810-4139)<br/><b>David Enoch</b><br/>(+91 770-219-9377)</td></tr></table>";
            System.Net.Mail.MailMessage mmessage = new System.Net.Mail.MailMessage("info@c3victory.in", to, subject, body);
            mmessage.Bcc.Add(bcc);
            mmessage.CC.Add(cc);
            mmessage.IsBodyHtml = true;
            client.Send(mmessage);
            //System.Net.Mail.MailMessage messageToThem = new System.Net.Mail.MailMessage("creative@c3church.in", email.Text, "Influence Conference 2013 - Registration", messageText);
            //messageToThem.IsBodyHtml = true;
            //client.Send(messageToThem);
            //name.Text = "";
            //email.Text = "";
            //phone.Text = "";
            ClientScript.RegisterClientScriptBlock(typeof(Page), "myScripts", "alert('Thank you for your sharing your experience and feedback.')", true);
            email.Text = "";
            name.Text = "";
            phone.Text = "";
            message.Text = "";
            return true;
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(typeof(Page), "myScripts", "alert('Oops! Something went wrong. Please try again in sometime. Thank you.')", true);
            return false;
        }
    }

}