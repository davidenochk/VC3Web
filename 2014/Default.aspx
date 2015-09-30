<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Influence Conference 2014</title>
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css'>
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/2014.css" rel="stylesheet" />
    <link href="css/audioplayer.css" rel="stylesheet" />
    <script src="../js/audioplayer.min.js"></script>
    <script src="js/jQuery.min.js"></script>
    <script src="js/analytics.js"></script>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width" />
    <meta content="Influence Conference is initiated to build the young church (you). Draw professionals,entrepreneurs and working population of the city with a vision to teach and impart to be the LIGHT wherever they are placed. We desire to empower you in your callingand challenge you to pursue your dreams. The Conference would include fresh sounds of worship and transforming sessions by few of our city’s renowned speakers. Ifyou want to live your dream and yet be used by God to His best, then do not miss this encounter with God, we are sure that the conference will ignite your passion and push you to your next season in life. Come lets join together to INFLUENCE our cities for God’s glory." title="Influence Conference 2014, C3 Victory Secunderabad" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tw-button").mouseenter(function () {
                $("#tw-button img").attr('src', 'graphics/soc-tw-on.png');
            });
            $("#tw-button").mouseleave(function () {
                $("#tw-button img").attr('src', 'graphics/soc-tw-off.png');
            });
            $("#inst-button").mouseenter(function () {
                $("#inst-button img").attr('src', 'graphics/soc-inst-on.png');
            });
            $("#inst-button").mouseleave(function () {
                $("#inst-button img").attr('src', 'graphics/soc-inst-off.png');
            });
            $("#fb-button").mouseenter(function () {
                $("#fb-button img").attr('src', 'graphics/soc-fb-on.png');
            });
            $("#fb-button").mouseleave(function () {
                $("#fb-button img").attr('src', 'graphics/soc-fb-off.png');
            });
        });
        $(document).ready(function () {
            $('a[href*=#]').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                && location.hostname == this.hostname) {
                    var $target = $(this.hash);
                    $target = $target.length && $target
                    || $('[name=' + this.hash.slice(1) + ']');
                    if ($target.length) {
                        var targetOffset = $target.offset().top;
                        $('html,body')
                        .animate({ scrollTop: targetOffset }, 1000);
                        $('#nav-menu').attr('data-class', 'hide');
                        $('#nav-menu li:gt(0)').fadeOut(100);
                        return false;
                    }
                }
            });
            $('.menu-icon').click(function () {
                if ($('#nav-menu').attr('data-class') == 'hide') {
                    $('#nav-menu').attr('data-class', 'show');
                    $('#nav-menu li:gt(0)').fadeIn(100);
                }
                else {
                    $('#nav-menu').attr('data-class', 'hide');
                    $('#nav-menu li:gt(0)').fadeOut(100);
                }
            });

            $("#register-now").click(function () {
                var $target = $("#content-register");
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body')
                    .animate({ scrollTop: targetOffset }, 1000);
                    return false;
                }
            });
        });
        $(document).ready(function () {
            $('.no-resource').click(function () {
                $('.bottom-message').html('There are no resources for this session.').stop().fadeIn('slow', function () {
                    $('.bottom-message').delay(4000).fadeOut('slow');
                });
            });
            $('.no-audio').click(function () {
                $('.bottom-message').html('The audio will be uploaded soon.').stop().fadeIn('slow', function () {
                    $('.bottom-message').delay(4000).fadeOut('slow');
                });
            });
            $('.no-video').click(function () {
                $('.bottom-message').html('The video will be uploaded soon.').stop().fadeIn('slow', function () {
                    $('.bottom-message').delay(4000).fadeOut('slow');
                });
            });
        });
        $(document).ready(function () {
            $(".close-button").click(function () {
                $("#popup-wrap").fadeOut('slow');
            });
        });
        $(document).ready(function () {
            $(".pastor-link").click(function () {
                $(".popup-window").html("");
                var speakername = $(this).attr('id');
                $.get(speakername + 'Info.txt', function (data) {
                    $(".popup-window").html(data);
                });
                $("#popup-wrap").fadeIn('slow');
            });
            $("#popup-wrap").click(function () { $(this).fadeOut('slow'); });
            $(".popup-window").click(function () { return false; });
            $(".no-resource").click(function () {
                //console.log($(this).attr('href').valueOf());
                return false;
            });
            $('.session-listen').click(function () {
                $('.listen-wrapper').css('display', 'block');
                //$('.youtube-wrapper').css('display', 'none').html('');
                $('.listen-wrapper').html('<audio controls><source src="' + $(this).attr('data-audio') + '"></audio><div class="closeAudio"> X </div>');
                $('.closeAudio').bind('click', function () { $('.listen-wrapper').html(''); });
                //console.log($(this).attr('data-audio'));
                return false;
            });
            $('.session-watch').click(function () {
                if ($(this).attr('data-id') != undefined) {
                    $('.sermon-wrapper').css('display', 'block');
                    $('.sermon-wrapper').html('<iframe width="853" height="480" src="//www.youtube.com/embed/' + $(this).attr('data-id') + '?autoplay=1?rel=0" frameborder="0" allowfullscreen></iframe>');
                }
            });
            $('.sermon-wrapper').click(function () {
                $(this).fadeOut(300);
                $(this).html('');
            });
        });
        function CloseAudio() {
            //console.log('Triggered');
            $('.listen-wrapper').html('');
        }

    </script>

    <script type="text/javascript">
        $(function () {
            $('.overlay-div .content-wrapper').mouseleave(function () {
                $('.overlay-div').css('display', 'none');
            }).click(function () { $('.overlay-div').css('display', 'block'); });

            $('.overlay-div .content-wrapper .close').click(function () {
                $('.overlay-div').css('display', 'none');
                return false;
            });

            $('.pastor-link').click(function () {
                var $ths = $(this);
                $('.overlay-div .content-wrapper img').attr('src', 'graphics/' + $(this).attr('data-id') + '.png');
                $('.overlay-div .content-wrapper .speaker-info').html('');
                $('.overlay-div .content-wrapper .speaker-name').html($($ths).children('.speaker-name').html());
                $.get('speakerInfo/' + $(this).attr('data-id') + 'Info.txt', function (data) {
                    $(".content-wrapper .speaker-info").html(data);
                    $('.overlay-div').css('display', 'block');
                });
            });
            $(".overlay-div .content-wrapper .content").customScrollbar({
                skin: "default-skin",
                hScroll: false,
                vScroll: true,
                updateOnWindowResize: true
            });
        });
    </script>
    <script type="text/javascript">
        function checkFeedback() {
            var str = "";
            if ($('.feedback-name').val() == "")
                str += "Please enter your name.\n";
            if ($('.feedback-email').val() == "")
                str += "Please enter your email address.\n";
            if ($('.feedback-phone').val() == "")
                str += "Please enter your mobile number.\n";
            if ($('.feedback-message').val() == "")
                str += "Please enter your feedback.";
            if (str == "") {
                return true;
            }
            else {
                alert(str);
                return false;
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="overlay-div">
            <div class="content-wrapper">
                <div class="close">X</div>
                <img src="#" />
                <span class="speaker-name"></span>
                <div class="speaker-info"></div>
            </div>
        </div>
        <%--<video class="main-video" autoplay loop poster="" id="bgvid">
            <source src="graphics/Highs.mp4" type="video/mp4">
        </video>--%>
        <img src="graphics/BannerGIFFullContentWeb.gif" class="mainbannerimg web" />
        <img src="graphics/BannerGIFHalfContentWeb.gif" class="mainbannerimg mobile" />
        <%--<div class="main-title">INFLUENCE '14</div>
        <%--<div class="main-details">9:30am - 5:30pm | 12 & 13 September | Taj Vivanta | Begumpet</div>--%>
        <%--<h3 class="conference-details" style="">SEPTEMBER <span style="font-size: 12pt">12 - 13 | 9am - 5pm<br />
        </span>Taj Vivanta, Begumpet</h3>--%>
        <div id="menu-wrap">
            <ul id="nav-menu" data-class="hide">
                <!--<li><a href="#home">HOME</a></li>-->
                <li><span class="menu-icon">+</span></li>
                <li><a href="#vision">VISION</a></li>
                <li><a href="#speakers">SPEAKERS</a></li>
                <li><a href="#sessions">SESSIONS</a></li>
                <li><a href="#register">FEEDBACK</a></li>
                <li><a href="http://www.c3victory.in/2013" target="_blank">2013</a></li>
            </ul>
        </div>
        <div class="center-div">
            <div class="promo-wrap">
                <iframe width="853" height="480" src="//www.youtube.com/embed/IFnZnQieQkw?rel=0?autoplay=1" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
        <div class="sermon-wrapper"></div>
        <br />
        <div id="content-vision" class="vision-content" name="vision">
            <span class="side-head">ABOUT THE CONFERENCE</span><br />
            Influence Conference is initiated to build the young church (you). Draw professionals,
                        entrepreneurs and working population of the city with a vision to teach and impart
                        to be the LIGHT wherever they are placed. We desire to empower you in your calling
                        and challenge you to pursue your dreams. The Conference would include fresh sounds
                        of worship and transforming sessions by few of our city’s renowned speakers. If
                        you want to live your dream and yet be used by God to His best, then do not miss
                        this encounter with God, we are sure that the conference will ignite your passion
                        and push you to your next season in life. Come lets join together to INFLUENCE our
                        cities for God’s glory.<br />
            It is astonishing to see the rate at which inhabitants are heading into our cities,
                        its rapid growth in numbers, businesses, change in the demography and a sea change
                        in the culture have brought our cities to a place of choosing the broad or the narrow
                        way, everyday of our lives. At this moment, we believe that it is of utmost importance
                        and of great urgency for the Church to go out and get into the society; the communities,
                        offices, sports and numerous other arenas to be God’s influence, there.
                        <div class="content">
                            <br />
                            <span class="side-head">CONFERENCE VISION</span><br />
                            We believe that every person has a dream and every person has a calling, our desire
                        is to encourage them to pursue their dreams and empower them in their calling and
                        to be the light as God challenges us in Matthew 5:14.
                        <br />
                            <br />
                            <span class="side-head">ABOUT VC3</span><br />
                            Victory Christian City Church (VC3) was planted in the year 2004, by Pastor Sumanth
                        Perumalla and Pastor Rani Perumalla, (after a long season of prayer and confirmation
                        from the Lord) in a small classroom of a school in Secunderabad with a desire to
                        reach out to the urban population of the city.Thus the vision of VC3 was set, --
                        “To build a church that is relevant to this generation and to be a positive influence
                        on the society”. From the time of its inception, VC3 stood by its vision and has
                        worked towards spreading the Gospel among the young generation, preparing them to
                        present themselves as true Christians while pursuing their God given dreams.VC3
                        now is a vibrant church filled with people passionate for God and serving God wherever
                        they are placed. Our Sunday services are packed with modern worship and practical
                        life transforming sermons.VC3 is also a part of the global C3 movement led by Ps
                        Phil and Chris Pringle, Sydney -Australia.
                        </div>
        </div>
        <div id="content-speakers" name="speakers" class="content-invert">
            <h1>
                <span class="header header-invert">SPEAKERS</span>
            </h1>
            <div class="speakers">
                <div id="sumanrani" class="pastor-link" data-id="sumannrani">
                    <img src="graphics/sumannrani.png" />
                    <span class="speaker-name">PS SUMANTH PERUMALLA<br />
                        PS RANI PERUMALLA</span>
                </div>
                <br />
                <div id="danielkishore" class="pastor-link" data-id="kishore">
                    <img src="graphics/kishore.png" />
                    <span class="speaker-name">PS DANIEL KISHORE</span>
                </div>
                <div id="samuelrufus" class="pastor-link" data-id="sam">
                    <img src="graphics/sam.png" />
                    <span class="speaker-name">RUFUS NALLARAJ</span>
                </div>
                <%--<div id="scott" class="pastor-link">
                    <img src="graphics/scott.png" />
                </div>--%>
                <div id="vidya" class="pastor-link" data-id="vidya">
                    <img src="graphics/vidya.png" />
                    <span class="speaker-name">DR VIDYA SRAVANTHI</span>
                </div>
                <div id="chinna" class="pastor-link" data-id="chinna">
                    <img src="graphics/chinna.png" />
                    <span class="speaker-name">DR CHINNABABU SUNKAVALLI</span>
                </div>
                <div id="munmun" class="pastor-link" data-id="munmun">
                    <img src="graphics/munmun.png" />
                    <span class="speaker-name">MUNMUN TANGRI</span>
                </div>
                <div id="santosh" class="pastor-link" data-id="santosh">
                    <img src="graphics/santosh.png" />
                    <span class="speaker-name">SANTHOSH VENNAMALLA</span>
                </div>
            </div>
        </div>
        <%--<div id="content-sessions" name="sessions">
            <h1 style="margin-bottom: 20px;">
                <span class="header">SESSIONS</span>
            </h1>--%>
        <%--<div class="session-names">
                <span class="session-Title">Building Your Wealth</span>
                <span class="session-Title">Climbing the corporate ladder</span>

                <span class="session-Title">Faith for your cause</span>

                <span class="session-Title">Social Justice</span>

                <span class="session-Title">Priorities in life</span>

                <span class="session-Title">Influential Leadership</span>

                <span class="session-Title">Your best health</span>
                <span class="session-Title">Entrepreneurship</span>

            </div>--%>
        <div id="content-sessions" name="sessions">
            <h1 style="margin-bottom: 20px;">
                <span class="header">SESSIONS</span>
            </h1>
            <div class="session-block">
                <div></div>
                <div class="session-Title">Building Your Wealth</div>
                <div class="session-speakerPic">
                    <img src="graphics/santosh.png" />
                </div>
                <div class="session-Speaker">Santosh Vennamalla</div>
                <div class="session-description"></div>
                <a href="https://www.slideshare.net/secret/y7KXixyW0E07VE" target="_blank" class="session-download">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Building%20Your%20Wealth%20-%20Santosh%20Vennamalla_1.mp3"><a href="">LISTEN</a></div>
                <div class="session-watch" data-id="k4WvayAvdoo">WATCH</div>
            </div>
            <div class="session-block">
                <div></div>
                <div class="session-Title">Entreprenuership</div>
                <div class="session-speakerPic">
                    <img src="graphics/munmun.png" />
                </div>
                <div class="session-Speaker">Munmun Tangri</div>
                <div class="session-description">This session would enocurage you to find your specific calling and pursue it. If your calling is to establish a business, Munmun shared the two views in which a business can be run. The Word View and The World View.</div>
                <a href="http://www.slideshare.net/c3victory/entrepreneurship-munmun-tangri-influence-conference-2014" target="_blank" class="session-download">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Entreprenuership%20-%20Munmun_2.mp3">LISTEN</div>
                <div class="session-watch" data-id="VVzphHFbKHU">WATCH</div>
            </div>
            <div class="session-block">
                <div></div>
                <div class="session-Title">Social Cause</div>
                <div class="session-speakerPic">
                    <img src="graphics/rani.png" />
                </div>
                <div class="session-Speaker">Ps Rani Perumalla</div>
                <div class="session-description">All of us are called to pray, help and speak out on behalf of the people who are being trafficked. Pastor Rani has shared the burden of the Church to reach out and help demolish the Human Trafficking.</div>
                <a href="" class="session-download no-resource">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Social%20Justice%20-%20Ps%20Rani%20Perumalla_1.mp3">LISTEN</div>
                <div class="session-watch" data-id="jB10olSJSw8">WATCH</div>
            </div>
            <div class="session-block">
                <div>
                    <div class="text"></div>
                </div>
                <div class="session-Title">Faith For Your Cause</div>
                <div class="session-speakerPic">
                    <img src="graphics/kishore.png" />
                </div>
                <div class="session-Speaker">PS DANIEL KISHORE</div>
                <div class="session-description">We need faith in every step of our life while we fulfill the purpose we are called for. We all have a unique purpose and yet no both are same. We often try to imitate another but this sermon would encourage you live your life like Jesus did and have faith like he did to fulfill the calling on your life.</div>
                <a href="" class="session-download no-resource">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802300.us.archive.org/6/items/FaithForYourCausePsDanielKishoreInfluence14/Faith%20For%20Your%20Cause%20-%20Ps%20Daniel%20Kishore%20-%20Influence14.mp3">LISTEN</div>
                <div class="session-watch" data-id="JP069TdwFaw">WATCH</div>
            </div>
            <div class="session-block">
                <div></div>
                <div class="session-Title">Priorities Of Life</div>
                <div class="session-speakerPic">
                    <img src="graphics/suman.png" />
                </div>
                <div class="session-Speaker">Ps Sumanth Perumalla</div>
                <div class="session-description">
                    We often have our priorities rearranged and we compromise on many things in our lives. In this session, Pastor Sumanth shared the top most priorities that we ought to follow to set our lives well managed.
                    <br />
                    1) God,
                    <br />
                    2) Family and
                    <br />
                    3) Ministry / Calling
                </div>
                <a href="" class="session-download no-resource">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Priorities%20Of%20Life%20-%20Sumanth.mp3">LISTEN</div>
                <div class="session-watch" data-id="9c7KX05gSSM">WATCH</div>
            </div>
            <div class="session-block">
                <div>
                    <div class="text"></div>
                </div>
                <div class="session-Title">Influential Leadership</div>
                <div class="session-speakerPic">
                    <img src="graphics/vidya.png" />
                </div>
                <div class="session-Speaker">Dr Vidya Sravanthi</div>
                <div class="session-description"></div>
                <a href="http://www.slideshare.net/c3victory/influential-leadership-dr-vidya-sravanthi-influence-conference-2014" target="_blank" class="session-download">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia802307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Entreprenuership%20-%20Munmun_2.mp3"><a href="">LISTEN</a></div>
                <div class="session-watch" data-id="56UKb10r8uo">WATCH</div>
            </div>
            <div class="session-block">
                <div>
                    <div class="text"></div>
                </div>
                <div class="session-Title">Your Best Health</div>
                <div class="session-speakerPic">
                    <img src="graphics/chinna.png" />
                </div>
                <div class="session-Speaker">Dr Chinnababu Sunkavalli</div>
                <div class="session-description"></div>
                <a href="" class="session-download no-resource">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia902307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Your%20Best%20Health%20-%20Chinnababu_1.mp3">LISTEN</div>
                <div class="session-watch" data-id="C7Aa-mBRmKw">WATCH</div>
            </div>
            <div class="session-block">
                <div>
                    <div class="text"></div>
                </div>
                <div class="session-Title">Climbing Corporate Ladder</div>
                <div class="session-speakerPic">
                    <img src="graphics/sam.png" />
                </div>
                <div class="session-Speaker">Samuel Rufus Nallaraj</div>
                <div class="session-description"></div>
                <a href="http://www.slideshare.net/c3victory/climbing-the-corporate-ladder-rufus-nallaraj-influence-conference-2014" class="session-download">RESOURCES</a>
                <div class="session-listen" data-audio="https://ia902307.us.archive.org/20/items/INF14LeadershipInfluenceVidya/INF14%20-%20Climbing%20the%20corporate%20ladder%20-%20Rufus%20Nallaraj_1.mp3">LISTEN</div>
                <div class="session-watch" data-id="dWw2jC1wXZ0">WATCH</div>
            </div>
        </div>

        <%--<div id="content-register" name="contact" style="background-color:#000; color:#f9f9f9; width: auto; height: auto;">
                <h1>
                    <span class="header" style="color:#f9f9f9;border-bottom-color:#666;width:100%;text-align:center;">REGISTRATION</span>
                </h1>
                <div class="content">
                    <div class="box">
                        <label>
                            <span>Full name *</span>
                            <asp:TextBox CssClass="input_text feedback-name" name="name" ID="name" runat="server"></asp:TextBox>
                        </label>
                        <label>
                            <span>Email *</span>
                            <asp:TextBox CssClass="input_text feedback-email" name="email" ID="email" runat="server"></asp:TextBox>
                        </label>
                        <label>
                            <span>Phone No *</span>
                            <asp:TextBox CssClass="input_text feedback-phone" name="phone" ID="phone" runat="server"></asp:TextBox>
                        </label>
                        <label>
                            <span>Feedback *</span>
                            <asp:TextBox CssClass="input_text feedback-message" name="feedback" ID="message" runat="server"></asp:TextBox>
                        </label>
                    </div>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="button submit-button" Text="SUBMIT" OnClick="btnSubmit_Click" />
                    <br />
                    <br />
                    <table class="social-wrap">
                        <tr>
                            <td>
                                <div class="social-button" id="fb-button">
                                    <a target="_blank" href="https://facebook.com/influenceconference">
                                        <img src="graphics/soc-fb-off.png" /></a>
                                </div>
                            </td>
                            <td>
                                <div class="social-button" id="tw-button">
                                    <a target="_blank" href="https://twitter.com/influenceconf">
                                        <img src="graphics/soc-tw-off.png" /></a>
                                </div>
                            </td>
                            <td>
                                <div class="social-button" id="inst-button">
                                    <a target="_blank" href="http://instagram.com/influenceconf">
                                        <img src="graphics/soc-inst-off.png" /></a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>--%>
        <%--<div id="content-sessions" name="sessions">
            <h1 style="margin-bottom: 20px;">
                <span class="header">SESSIONS</span>
            </h1>
            <div class="content">
                <div class="session-block">
                    <div></div>
                    <div class="session-Title">Is there not a cause?</div>
                    <div class="session-speakerPic">
                        <img src="graphics/sumanth.png" />
                    </div>
                    <div class="session-Speaker">Ps Sumanth Perumalla</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="sermon-wrapper"></div>
                <div class="session-block">
                    <div></div>
                    <div class="session-Title">Build Your Wealth</div>
                    <div class="session-speakerPic">
                        <img src="graphics/santosh.png" />
                    </div>
                    <div class="session-Speaker">Santhosh Vennamalla</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="session-block">
                    <div></div>
                    <div class="session-Title">Entreprenuership</div>
                    <div class="session-speakerPic">
                        <img src="graphics/munmun.png" />
                    </div>
                    <div class="session-Speaker">Munmun Tangri</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch" data-id="">WATCH</div>
                </div>
                <div class="session-block">
                    <div></div>
                    <div class="session-Title">Social Justice</div>
                    <div class="session-speakerPic">
                        <img src="graphics/rani.png" />
                    </div>
                    <div class="session-Speaker">Ps Rani Perumalla</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="session-block">
                    <div>
                        <div class="text"></div>
                    </div>
                    <div class="session-Title">Priorities In Life</div>
                    <div class="session-speakerPic">
                        <img src="graphics/sumanth.png" />
                    </div>
                    <div class="session-Speaker">Ps Sumanth Perumalla</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="session-block">
                    <div>
                        <div class="text"></div>
                    </div>
                    <div class="session-Title">Influential Leadership</div>
                    <div class="session-speakerPic">
                        <img src="graphics/vidya.png" />
                    </div>
                    <div class="session-Speaker">Dr Vidya Sravanthi</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="session-block">
                    <div>
                        <div class="text"></div>
                    </div>
                    <div class="session-Title">Your Best Health</div>
                    <div class="session-speakerPic">
                        <img src="graphics/chinna.png" />
                    </div>
                    <div class="session-Speaker">Dr Chinnababu Sunkavalli</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
                <div class="session-block">
                    <div>
                        <div class="text"></div>
                    </div>
                    <div class="session-Title">Climbing The Corporate Ladder</div>
                    <div class="session-speakerPic">
                        <img src="graphics/sam.png" />
                    </div>
                    <div class="session-Speaker">Samuel Rufus Nallaraj</div>
                    <div class="session-description"></div>
                    <div class="session-download"><a href="">RESOURCES</a></div>
                    <div class="session-listen"><a href="">LISTEN</a></div>
                    <div class="session-watch">WATCH</div>
                </div>
            </div>
        </div>--%>
        <div id="content-register" class="invert-bg" name="register">
            <h1>
                <span class="header header-invert">FEEDBACK</span>
            </h1>
            <%--<div class="register-notes">
                ADULTS <span class="imp">Rs 1200</span><br />
                KIDS <span class="imp">Rs 800</span><br />
                includes lunch, refreshments, delegate pack<br />
                and an exciting <span class="imp">Kids Conference</span> for children < 12years
            </div>--%>
            <div class="form-register">
                <span class="form-label">Name *</span>
                <asp:TextBox CssClass="input_text feedback-name" name="name" ID="name" runat="server"></asp:TextBox>
                <span class="form-label">Email *</span>
                <asp:TextBox CssClass="input_text feedback-email" name="email" ID="email" runat="server"></asp:TextBox>
                <span>Phone *</span>
                <asp:TextBox CssClass="input_text feedback-phone" name="phone" ID="phone" runat="server"></asp:TextBox>
                <span>Tell us about your experience at Influence'14 *</span>
                <asp:TextBox CssClass="input_text feedback-message" name="feedback" ID="message" runat="server"></asp:TextBox>
                <asp:Button ID="btnSubmit" runat="server" CssClass="button submit-button" Text="Submit" CausesValidation="true" OnClientClick="return checkFeedback();" OnClick="btnSubmit_Click" />k
            </div>
            <br />
        </div>
        <div id="content-sponsor" name="sponsor">
            <h1><span class="header">OUR SPONSORS</span></h1>
            <div class="sponsor-details">
                <div class="sponsor-link">
                    <img src="graphics/businessseva.jpg" />
                    <img src="graphics/mxit.jpg" />
                    <br />
                    <img src="graphics/dhanush.jpg" />
                    <img src="graphics/drywash.jpg" />
                    <img src="graphics/leader.jpg" />
                    <img src="graphics/cedar.jpg" />
                    <img src="graphics/jaya.jpg" />
                    <img src="graphics/grace.jpg" />
                    <img src="graphics/led.png" />
                    <img style="height: 100px;" src="graphics/sharon.png" />
                </div>
            </div>
        </div>
        <div class="footer">
            <img src="graphics/churchLogo.png" class="logo" />
            <div class="church-address">
                <span class="main">C3 Victory Secunderabad</span><br />
                Plot No 90 P&T Colony<br />
                Trimulgherry, Hyderabad - 500015<br />
                <a href="http://www.c3victory.in" class="website" target="_blank">Website</a>
            </div>
            <%--<div class="social-wrapper">
                <a target="_blank" href="https://facebook.com/influenceconference">
                    <img src="graphics/soc-fb-off.png" class="social-button" /></a>
                <a target="_blank" href="https://twitter.com/influenceconf">
                    <img src="graphics/soc-tw-off.png" class="social-button" /></a>
                <a target="_blank" href="http://instagram.com/influenceconf">
                    <img src="graphics/soc-inst-off.png" class="social-button" /></a>
            </div>--%>
        </div>
        <div class="listen-wrapper" id="divListen" runat="server">
            <%--<iframe src="https://archive.org/embed/FaithTappingIntoTheInvisiblePart3" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>--%>
        </div>
    </form>
</body>
</html>



