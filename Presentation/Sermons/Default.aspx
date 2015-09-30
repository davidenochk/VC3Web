<%@ Page Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Sermons_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/audioplayer.css" rel="stylesheet" />
    <script src="../../js/audioplayer.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var currentWidth = $('.sermon-banner-art').width();
            var currentHeight = (currentWidth * 9) / 16;
            var currentYoutubeUrl = document.getElementById('<%=hdYoutubeMain.ClientID %>').value;
            //$('.watch-button').click(function () {
            //    currentWidth = $('.imgSermonArt').width();
            //    currentHeight = (currentWidth * 9) / 16;
            //    $('.youtube-wrapper').css('display', 'block');
            //    $('.imgSermonArt').css('display', 'none');
            //    $('.imgSermonArt').css('display', 'none');
            //    $('.sermon-buttons').animate({ 'margin-top': '10px' }, 500);
            //    $('.youtube-wrapper').html('<object width="' + currentWidth + '" height="' + currentHeight + '"><param name="movie" value="' + currentYoutubeUrl + '"></param><param name="allowFullScreen" value="true"></param> <param name="allowscriptaccess" value="always"></param> <embed src="' + currentYoutubeUrl + '" type="application/x-shockwave-flash" width="' + currentWidth + '" height="' + currentHeight + '" allowscriptaccess="always" allowfullscreen="true"></embed></object>');
            //    $('.listen-wrapper').css('display', 'none').html();
            //});
            $('.listen-button').click(function () {
                $('.listen-wrapper').css('display', 'block');
                $('.youtube-wrapper').css('display', 'none').html('');
                $('.imgSermon').css('display', 'block');
                $('.sermon-wrap').css('display', 'block');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper">
        <div class="message" id="divMessage" runat="server" visible="false"></div>
        <div class="sermon-wrap" id="divSermonWrap" runat="server">
            <div class="sermon-banner">
                <div class="back-center mobile-image imgSermon" style="background-image: url(<%=sermonArtLink%>);"></div>
                <asp:Image ID="imgSermonArt" Style="display: none;" runat="server" CssClass="imgSermonArt" />
                <div class="youtube-wrapper">
                </div>
                <asp:HiddenField ID="hdYoutubeMain" runat="server" />
                <div class="listen-wrapper" id="divListen" runat="server">
                </div>
            </div>
            <div class="sermon-controls-wrap" id="divSermonControlsWrap" runat="server">
                <asp:Label ID="lblSermonTitle" runat="server" CssClass="sermon-title"></asp:Label>
                <asp:Label ID="lblSermonSpeaker" runat="server" CssClass="sermon-by"></asp:Label>
                <asp:Label ID="lblSermonDate" runat="server" CssClass="sermon-date"></asp:Label>
                <asp:Label ID="lblSermonDescription" runat="server" CssClass="sermon-desc"></asp:Label>
                <div class="sermon-buttons" id="divListenWatch" runat="server">
                    <ul>
                        <li class="listen-button" id="liListenButton" runat="server"><a>Listen</a></li>
                        <li class="watch-button" id="liWatchButton" runat="server"><a>Watch</a></li>
                        <li class="download-button" id="liDownloadButton" runat="server">Download</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="series-wrap" id="divSeriesWrap" runat="server">
            <%--<div class="side-head" style="font-size:1.5em;">More from this series</div>--%>
            <div class="more-in-series" id="divMoreInSeries" runat="server" visible="false">Browse More In This Series</div>
            <div class="back-center mobile-image" style="background-image:url(<%=seriesArtLink%>);"></div>
            <asp:Image CssClass="imgSeriesArt" style="display:none;" ID="imgSeriesArt" runat="server" />
            <asp:Label ID="lblSeriesName" runat="server" CssClass="series-name" />
            <asp:Label ID="lblSeriesBy" runat="server" CssClass="series-by" />
            <asp:Label ID="lblSeriesDesc" runat="server" CssClass="series-desc"></asp:Label>
            <div class="series-sermons-list" id="divSermonsUnderSeries" runat="server">
                <%--Where the sermons in the series gets listed dynamically--%>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="archive-wrap">
            <a href="../Archive">
                <div class="browse-text">Browse the full sermon archive</div>
                <div class="back-center mobile-image" style="margin:0;max-height:300px;background-image: url(../../Images/browseForMore.jpg)"></div>
                <asp:Image Style="display: none;" ID="imgBrowseArchive" runat="server" />
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
