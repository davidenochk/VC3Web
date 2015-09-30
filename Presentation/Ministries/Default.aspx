<%@ Page Title="VC3 Church - Ministries" Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper">
        <div class="second-nav-wrap">
            <ul class="second-nav-header">
                <li class="sundayservice"><a href="#sundayservice">Sunday Service</a></li>
                <li class="kidschurch"><a href="#kidschurch">Children's Church</a></li>
                <li class="connectgroups"><a href="#connectgroups">Connect Groups</a></li>
                <li class="corporateprayer"><a href="#corporateprayer">Corporate Prayer</a></li>
                <li class="conference"><a href="#conference">Influence Conference</a></li>
                <%-- Couple's event --%>
                <%-- Women's Breakfast Meet --%>
                <%--<li class="valiant"><a href="#valiant">Valiant Men</a></li>
                <li class="beavolunteer"><a href="#serve">Serve</a></li>--%>
            </ul>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="background-image: url(../../Images/banner-sundayservice.jpg)" class="back-top mobile-image sundayservice"></div>
        <asp:Image ID="imgSundayService" runat="server" Style="display: none;" CssClass="big-banner-content sundayservice" ImageUrl="~/Images/banner-sundayservice.jpg" />
        <div class="about-description">
            The best place you could be on a Sunday is the Church. We welcome you to join us this Sunday so we could celebrate the Grace and shout to the Lord with Joy.
        </div>
        <div class="back-top mobile-image kidschurch" style="background-image: url(../../Images/banner-kidschurch.jpg)"></div>
        <asp:Image ID="imgChildrenChurch" runat="server" Style="display: none;" CssClass="big-banner-content kidschurch" ImageUrl="~/Images/banner-kidschurch.jpg" />
        <div class="about-description">
            The Kids Team love kids, and are fully committed to seeing that the whole time your child is with us is the greatest, most fun and most memorable time in their week.Our heart is that your kids would love their church and that we would help them to connect with others and with their God. Our belief is that God can be discovered and encountered no matter how old someone is.For us there is no greater joy than to see you coming as a family every week to discover, connect with and encounter Christ and all He has for you and your children.We look forward to seeing you in church!
        </div>
        <%--<div class="back-top mobile-image connectgroups" style="background-image: url(../../Images/banner-connectgroup.jpg)"></div>
        <asp:Image ID="imgConnectGroups" Style="display: none;" runat="server" CssClass="big-banner-content connectgroups" ImageUrl="~/Images/banner-connectgroup.jpg" />
        <div class="about-description">
            Connect Groups provide an opportunity outside of our church services for people to get together and talk about God. They meet all times of the day, all through the week, in many different locations - cafes, homes, workplaces, schools, universities, parks, retirement villages... any place where it is convenient for people to get together.
        </div>--%>
        <div class="back-top mobile-image corporateprayer" style="background-image: url(../../Images/banner-fridayprayer.jpg)"></div>
        <asp:Image ID="imgCorporatePrayer" Style="display: none;" runat="server" CssClass="big-banner-content corporateprayer" ImageUrl="~/Images/banner-fridayprayer.jpg" />
        <div class="about-description">
            The place and time where the chains are broken and we see things in the spirit and strategize for the coming days is the "Corporate Prayer". We gather to ask God his will and his power so we could execute according to his plans.
        </div>
        <div class="back-top mobile-image conference" style="background-image: url(../../Images/banner-influenceconference.jpg)"></div>
        <asp:Image ID="imgInfluence" runat="server" Style="display: none;" CssClass="big-banner-content conference" ImageUrl="~/Images/banner-influenceconference.jpg" />
        <div class="content-description">
            Influence Conference is initiated to build the young church (you). Draw professionals, entrepreneurs and working population of the city with a vision to teach and impart to be the LIGHT wherever they are placed. We desire to empower you in your calling and challenge you to pursue your dreams. The Conference would include fresh sounds of worship and transforming sessions by few of our city’s renowned speakers. If you want to live your dream and yet be used by God to His best, then do not miss this encounter with God, we are sure that the conference will ignite your passion and push you to your next season in life. Come lets join together to INFLUENCE our cities for God’s glory.
It is astonishing to see the rate at which inhabitants are heading into our cities, its rapid growth in numbers, businesses, change in the demography and a sea change in the culture have brought our cities to a place of choosing the broad or the narrow way, everyday of our lives. At this moment, we believe that it is of utmost importance and of great urgency for the Church to go out and get into the society; the communities, offices, sports and numerous other arenas to be God’s influence, there.
            <br />
            <a href="http://www.influenceconference.in" target="_blank">Visit Influence Conference Site</a>
        </div>
    </div>
</asp:Content>

