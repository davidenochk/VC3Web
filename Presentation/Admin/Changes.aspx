<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Changes.aspx.cs" Inherits="Presentation_Admin_Changes" MasterPageFile="~/Presentation/main.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/Admin.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.panel').find('input[type="text"]').each(function () {
                $(this).val('');
            });
            $('.panel').find('textarea').each(function () {
                $(this).val('');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="gdvSeries" runat="server" AutoGenerateColumns="False" AllowSorting="true" CssClass="grd-main">
        <Columns>
            <asp:BoundField DataField="seriesID" HeaderText="Series ID" ShowHeader="true" />
            <asp:BoundField DataField="seriesName" HeaderText="Name" ShowHeader="true" />
            <asp:BoundField DataField="seriesBy" HeaderText="Series By" ShowHeader="true" />
            <asp:ImageField DataImageUrlField="ArtLink" HeaderText="Art" ShowHeader="true" ItemStyle-CssClass="grd-series-art" />
        </Columns>
    </asp:GridView>
    <%--<asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
    <div class="panel panel1 default">
        <span class="title">Add Sermon</span>
        <asp:Panel ID="pnlAddSermon" runat="server">
            <asp:Label ID="lblSermonTitle" runat="server" Text="Sermon Title"></asp:Label><br />
            <asp:TextBox ID="txtSermonTitle" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSermonDescr" runat="server" Text="Sermon Description"></asp:Label><br />
            <asp:TextBox ID="txtSermonDescr" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSermonBy" runat="server" Text="Sermon By"></asp:Label><br />
            <asp:DropDownList ID="ddlSpeakers" runat="server"></asp:DropDownList><br />
            <br />
            <asp:Label ID="lblSermonPlace" runat="server" Text="Sermon Place"></asp:Label><br />
            <asp:TextBox ID="txtSermonPlace" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSermonDate" runat="server" Text="Sermon Date"></asp:Label><br />
            <asp:TextBox ID="txtSermonDate" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSeriesID" runat="server" Text="Series ID"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlSeries" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblImageLink" runat="server" Text="Image Link"></asp:Label><br />
            <asp:TextBox ID="txtSermonImageLink" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblAudioLink" runat="server" Text="Audio Link"></asp:Label><br />
            <asp:TextBox ID="txtSermonAudioLink" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblVideoLink" runat="server" Text="Video Link"></asp:Label><br />
            <asp:TextBox ID="txtSermonVideoLink" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSermonArtLink" runat="server" Text="Sermon Art Link"></asp:Label><br />
            <asp:TextBox ID="txtSermonArtLink" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSermonArtSmallLink" runat="server" Text="Sermon Small Art Link"></asp:Label><br />
            <asp:TextBox ID="txtSermonArtSmallLink" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnAddSermonBlock" runat="server" Text="Add Sermon Block" OnClick="btnAddSermonBlock_Click" />
        </asp:Panel>
    </div>
    <div class="panel panel2">
        <span class="title">Add Sermon Series</span>
        <asp:Panel ID="pnlAddSeries" runat="server">
            <asp:Label ID="lblSeriesName" runat="server" Text="Series Name"></asp:Label><br />
            <asp:TextBox ID="txtSeriesName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSeriesBy" runat="server" Text="Series By"></asp:Label><br />
            <asp:DropDownList ID="ddlSeriesBy" runat="server"></asp:DropDownList><br />
            <asp:Label ID="lblSeriesDescr" runat="server" Text="Series Description"></asp:Label><br />
            <asp:TextBox ID="txtSeriesDescr" runat="server" TextMode="MultiLine"></asp:TextBox><br />
            <asp:Label ID="lblSeriesImage" runat="server" Text="Image Link"></asp:Label><br />
            <asp:TextBox ID="txtSeriesImage" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblBannerImage" runat="server" Text="Banner Link"></asp:Label><br />
            <asp:TextBox ID="txtSeriesBanner" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblArtSmallLink" runat="server" Text="Art Small Link"></asp:Label><br />
            <asp:TextBox ID="txtArtSmallLink" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSeriesVideoPreview" runat="server" Text="Video Link"></asp:Label><br />
            <asp:TextBox ID="txtSeriesVideoPreview" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnAddSeries" runat="server" Text="Add Series" OnClick="btnAddSeries_Click" />
        </asp:Panel>
    </div>
    <div class="panel panel3">
        <span class="title">Add Speaker</span>
        <asp:Panel ID="pnlAddSpeaker" runat="server">
            <asp:Label ID="lblSpeakerName" runat="server" Text="Speaker Name"></asp:Label><br />
            <asp:TextBox ID="txtSpeakerName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSpeakerInfo" runat="server" Text="Speaker Information"></asp:Label><br />
            <asp:TextBox ID="txtSpeakerInfo" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSpeakerEmail" runat="server" Text="Speaker Email"></asp:Label><br />
            <asp:TextBox ID="txtSpeakerEmail" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblFacebook" runat="server" Text="Speaker Facebook Address"></asp:Label><br />
            <asp:TextBox ID="txtFacebookAddress" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblTwitter" runat="server" Text="Twitter Address"></asp:Label><br />
            <asp:TextBox ID="txtTwitter" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblWebsite" runat="server" Text="Web Site"></asp:Label><br />
            <asp:TextBox ID="txtWebsite" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSpeakerImage" runat="server" Text="Speaker Image"></asp:Label><br />
            <asp:TextBox ID="txtSpeakerImage" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnAddSpeaker" runat="server" Text="Add Speaker" OnClick="btnAddSpeaker_Click"/>
        </asp:Panel>
    </div>--%>
</asp:Content>