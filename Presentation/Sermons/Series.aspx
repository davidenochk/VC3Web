<%@ Page Title="" Language="C#" MasterPageFile="~/Presentation/main.master" AutoEventWireup="true" CodeFile="Series.aspx.cs" Inherits="Presentation_Sermons_Series" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrap" data-ng-controller="SermonController" data-ng-cloak="">
        <div class="banner_wrap">
            <div class="bg" data-ng-style="{'background-image': 'url(' + serie.ARTLINK + ')'}">
                <div class="slider_content">
                </div>
            </div>
        </div>
        <div class="banner-margin"></div>
        <div class="main_content">
            <div class="main_title">SERMON SERIES : {{serie.SERIESNAME}}</div>
            <div class="content" data-ng-bind-html="seriesDescription">
            </div>
            <div class="sermons-grid-wrap">
                <div class="sermons-grid">
                    <div class="sermon-grid-comp" data-ng-repeat="ser in sermons.findAll('SERIESID',serie.SERIESID)">
                        <a data-ng-href="{{GetSermonURL(ser.SERMONID)}}">
                            <div class="sermons-art">
                                <img src="#" data-ng-class="{'zoom-image' : !ser.ARTSMALLLINK}" data-ng-src="{{ser.ARTSMALLLINK ? ser.ARTSMALLLINK : (ser.ARTLINK ? ser.ARTLINK : (serie.ARTLINK ? serie.ARTLINK : ''))}}" alt="" />
                                <div class="grid-type">
                                    <span class="name">{{ser.SERMONNAME}}</span>
                                    <%--<span class="issermon">{{ser.SERIESID == '0' ? 'Sermon' : 'Sermon Series' }}</span>--%>
                                    <span class="date">({{ser.SERMONDATE | date : 'dd MMM, yyyy'}})</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

