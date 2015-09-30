<%@ Page Title="VC3 Church - Next Service" Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Services_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper">
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
        <img src="../../Images/about-thissunday.jpg" style="width: 100%; max-width: 1200px;" />
        <br />
        <br />
        <div class="content-description">
            The best place for you to be on Sunday morning is at Church. We would like to welcome you to join us as we celebrate. We have amazing Praise time, great Worship experience, the Word from God, a time to give into the Kingdom of God and an awesome time to connect with friends.
            <br />
            God has a greater plan for each and everyone of us. A Church being the house of God, would reveal us the plan of God as we journey with others. We believe that the experience we have here and the things we learn would influence our daily lives and enable us to walk in the plan of God.
            <br />
            If you are planning to visit us for the first time, do let us know, so that we would like to make this a VIP experience and let us take care of you throughout the service.
            <br />
            <br />
            <h3>If you would like to visit us, drop us your details so that we could guide you and welcome you.</h3>
            <br />
            <h4>Send details to <a style="color: #fff" href="mailto:info@c3victory.in">info@c3victory.in</a></h4>
            <%--<asp:UpdatePanel ID="upnlPlanVisit" runat="server">
                <ContentTemplate>
                    <div class="simple-form">
                        <span class="heading">For VIP experience</span>
                        <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:Label ID="lblMobile" runat="server" Text="Contact Number"></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSendDetails" runat="server" Text="Send Details" CssClass="volunteer-submit" OnClick="btnSendDetails_Click" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSendDetails" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="upnlProgress" runat="server" AssociatedUpdatePanelID="upnlPlanVisit">
                <ProgressTemplate>
                    <div class="progress" runat="server">Please wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>--%>
        </div>
    </div>
</asp:Content>

