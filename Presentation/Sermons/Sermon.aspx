<%@ Page Title="" Language="C#" MasterPageFile="../main.master" AutoEventWireup="true" CodeFile="Sermon.aspx.cs" Inherits="Presentation_Sermons_Sermon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrap" data-ng-controller="SermonController" data-ng-cloak="">
        <div class="banner_wrap">
            <div class="bg mobile-image back-center" data-ng-style="{'background-image': 'url(' + sermon.Art + ')'}">
                <div class="slider_content">
                </div>
            </div>
        </div>
        <div class="banner-margin"></div>
        <div class="main_content">
            <div class="lg-text">{{sermon.Name}}</div>
            <div class="content" data-ng-bind-html="sermonDescription">
            </div>
            <div data-layout="row" data-layout-sm="column" data-layout-align="center center">
                <div class="lg-btn lg-btn-dk" data-ng-click="RedirectToSermon()">Listen</div>
                <div class="lg-btn lg-btn-lt" data-ng-click="DownloadSermon()">Download</div>
            </div>
        </div>
    </div>
</asp:Content>

