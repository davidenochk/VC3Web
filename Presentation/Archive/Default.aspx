<%@ Page Title="VC3 Church - Sermon Archive" Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Sermons_Archive_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrap" data-ng-controller="ArchiveController" data-ng-cloak="">
        <div class="banner_wrap">
            <div class="bg" data-ng-style="{'background-image': 'url(' + sermon.ARTLINK + ')'}">
                <div class="slider_content">
                    <div class="slide md-text">Latest Sermon</div>
                    <div class="slide lg-text">{{sermon.SERMONNAME}}</div>
                    <div class="slide">
                        <div class="lg-btn-trans" data-ng-click="RedirectToSermon(sermon.SERMONID);">Listen</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-margin"></div>
        <div class="main_content">
            <div class="sermons-grid-wrap">
                <div class="sermons-grid" id="sermonsgrid" runat="server">
                    <div class="sermon-grid-comp" data-ng-repeat="ser in archive">
                        <a data-ng-href="{{ser.SERIESID == '0' ? '../Sermons?sermonid=' + ser.SERMONID : '../Sermons?seriesid=' + ser.SERIESID}}">
                            <div class="sermons-art">
                                <img src="#" data-ng-src="{{ser.SERIESID == '0' ? ser.ARTSMALLLINK : series.find('SERIESID',ser.SERIESID).ARTSMALLLINK}}" alt="" />
                                <div class="grid-type">
                                    <span class="name">{{ser.SERIESID == 0 ? ser.SERMONNAME : ser.SERIES.SERIESNAME }}</span>
                                    <span class="date">({{ser.SERMONDATE | date : 'MMM d, y'}})</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

