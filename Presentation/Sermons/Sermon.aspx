<%@ Page Title="" Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Sermon.aspx.cs" Inherits="Presentation_Sermons_Sermon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrap" data-ng-controller="SermonController" data-ng-cloak="">
        <div class="banner_wrap">
            <div class="bg" data-ng-style="{'background-image': 'url(' + sermon.ARTLINK + ')'}">
                <div class="slider_content">
                </div>
            </div>
        </div>
        <div class="banner-margin"></div>
        <div class="main_content">
            <div class="main_title">SERMON : {{sermon.SERMONNAME}}</div>
            <div class="content" data-ng-bind-html="sermonDescription">
            </div>
        </div>
    </div>
</asp:Content>

