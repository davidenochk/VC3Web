<%@ Page Title="VC3 Church - Need Prayer" Language="C#" MasterPageFile="../main.master" AutoEventWireup="true" CodeFile="NeedPrayer.aspx.cs" Inherits="Presentation_Home_NeedPrayer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper">
        <asp:Image ImageUrl="../../Images/banner-needprayer.jpg" runat="server" CssClass="sermon-art" />
        <br />
        <br />
        <h2>If you have a prayer request, do drop a message on facebook or write to us <a style="color: #FFF" href="mailto:info@c3victory.in">info@c3victory.in</a></h2>
        <h3>We are more than happy to pray for you.</h3>
        <%--<div class="volunteer-form">
            <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="upnlBeAVolunteer" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="simple-form">
                        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" CssClass="errorMessage"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblName" Text="Your Name"></asp:Label><br />
                        <asp:TextBox runat="server" ID="txtName"></asp:TextBox><br />
                        <asp:Label runat="server" ID="lblEmail" Text="Your Email"></asp:Label><br />
                        <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox><br />
                        <asp:Label runat="server" ID="lblMobile" Text="Your Contact Number"></asp:Label><br />
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox><br />
                        <asp:Label ID="lblRequest" runat="server" Text="Prayer Request"></asp:Label><br />
                        <asp:TextBox ID="txtRequest" runat="server" TextMode="MultiLine"></asp:TextBox><br />
                        <asp:Button CssClass="volunteer-submit" ID="btnPrayerRequest" runat="server" Text="Post Request" OnClick="btnPostPrayerRequest_Click" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnPrayerRequest" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="updateProgressVolunteer" runat="server" AssociatedUpdatePanelID="upnlBeAVolunteer">
                <ProgressTemplate>
                    <div class="progress">Please wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>--%>
    </div>
</asp:Content>

