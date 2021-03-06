﻿<%@ Page Title="" Language="C#" MasterPageFile="../main.master" AutoEventWireup="true" CodeFile="Series.aspx.cs" Inherits="Presentation_Sermons_Series" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrap" data-ng-controller="SeriesController" data-ng-cloak="">
        <div class="banner_wrap">
            <div class="bg" data-ng-style="{'background-image': 'url(' + serie.Art + ')'}">
                <div class="slider_content">
                </div>
            </div>
        </div>
        <div class="banner-margin"></div>
        <div class="main_content">
            <div class="main_title">{{serie.Name}}</div>
            <div class="content" data-ng-bind-html="seriesDescription">
            </div>
            <div class="sermons-grid-wrap">
                <div class="sermons-grid">
                    <div class="sermon-grid-comp" data-ng-repeat="ser in sermons">
                        <a data-ng-href="{{GetSermonURL(ser.ID)}}">
                            <div class="sermons-art">
                                <img src="#" data-ng-class="{'zoom-image' : !ser.SmallArt}" data-ng-src="{{ser.SmallArt ? ser.SmallArt : (ser.Art ? ser.Art : (serie.Art ? serie.Art : ''))}}" alt="" />
                                <div class="grid-type">
                                    <span class="name">{{ser.Name}}</span>
                                    <span class="date">({{ser.On | dateCustom}})</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

