<%@ Page Title="C3 Victory Secunderabad - GROW • BUILD • INFLUENCE" Language="C#" MasterPageFile="../main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $.ajax('/vc3siteservice.asmx/GetSlideImages', {
                method: 'post', dataType: 'json',
                contentType: "application/json; charset=utf-8",
            })
            .success(function (data) {
                //PopulateSlides(JSON.parse(data.d));
                //SetSlideMotion();
            })
            .error(function (err) {
                console.log(err);
            })
        });
        //Create markup for populating the slides div with images from DB
        PopulateSlides = function (slides) {
            //loop through and create images
            var div = '';
            for (var i = 0; i < slides.length; i++) {
                div += '<img src="' + slides[i].slideimg_bg + '" alt="' + slides[i].slidetitle + '" data-link="' + slides[i].slidelink + '"/>';
            }
            //uncomment if you are going to use this
            var elem = document.getElementById('slides');
            elem.innerHTML = div;

            $('#slides img').each(function (i, th) {
                var link = $(th).attr('data-link');
                $(th).click(function () {
                    if (link != 'null' && link != undefined) {
                        window.open(link, '_self');
                    }
                });
            });
        };
        //animate slides
        SetSlideMotion = function () {
            if ($('#slides img').length != 1) {
                $('#slides').slidesjs({
                    width: 1600,
                    height: 590,
                    navigation: {
                        effect: "fade"
                    },
                    effect: {
                        fade: {
                            speed: 400
                        }
                    },
                    play: {
                        active: false,
                        effect: "fade",
                        auto: true,
                        interval: 4000

                    },
                    pagination: {
                        active: false
                    },
                    navigation: { active: false }
                });
            }
            else {
                $('#slides').css('display', 'block').children('img');
            }
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="bg"></div>
        <div class="shortcut-wrapper">
        <div class="home-title">RELEVANCE</div>
            <div class="archive"><a href="../Archive/Default.aspx">Sermon Archive</a></div>
            <div class="about"><a href="../About/Default.aspx">About Us</a></div>
        </div>
    </div>
</asp:Content>
