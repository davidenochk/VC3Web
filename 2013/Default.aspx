<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Influence Conference 2013 - Main</title>
    <script src="js/jQuery.min.js"></script>
    <link href="css/main.css" rel="stylesheet" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
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
                        return false;
                    }
                }
            });

            $("#register-now").click(function () {
                var $target = $("#content-contact");
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
                console.log($(this).attr('href').valueOf());
                return false;
            });
        });
        $(function () {
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
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table id="main-table" border="0" cellspacing="0" cellpadding="0">
            <tr id="header-wrap">
                <td id="header-content" style="vertical-align: middle; width: 100%;">
                    <img src="graphics/churchLogoSmall.png" alt="Victory Christian City Church" class="church-logo" />
                    <img class="logoImg" src="graphics/circleLogo.png" alt="Influence Conference 2013" />
                    <h3 class="conference-details" style="">SEPTEMBER <span style="font-size: 12pt">5 - 6 | 9:30am - 4pm<br />
                    </span>HOTEL ROYAL REVE, SECUNDERABAD</h3>
                    <div id="menu-wrap">
                        <ul id="nav-menu">
                            <!--<li><a href="#home">HOME</a></li>-->
                            <li><a href="#vision">VISION</a></li>
                            <li><a href="#speakers">SPEAKERS</a></li>
                            <li><a href="#sessions">SESSIONS</a></li>
                            <li><a href="#contact">FEEDBACK</a></li>
                            <li><a href="http://www.influenceconference.in" target="_self">2014</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="introImg">
                    <div class="promo-wrap">
                        <iframe width="640" height="400" src="//www.youtube.com/embed/IS0u2Kq0TaE" frameborder="0" allowfullscreen></iframe>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="content-wrap">
                    <!--<div id="content-home" name="home">
                    <h1>
                        <span class="header">HOME</span>
                    </h1>
                    <div class="content">
                    </div>
                </div>-->
                    <br />
                    <br />
                    <div id="content-vision" name="vision">
                        <span class="side-head">ABOUT THE CONFERENCE</span><br />
                        <br />
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
                            <br />
                            We believe that every person has a dream and every person has a calling, our desire
                        is to encourage them to pursue their dreams and empower them in their calling and
                        to be the light as God challenges us in Matthew 5:14.
                        <br />
                            <br />
                            <span class="side-head">ABOUT VC3</span><br />
                            <br />
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
                    <div id="content-speakers" name="speakers">
                        <h1>
                            <span class="header">SPEAKERS</span>
                        </h1>
                        <div class="content">
                            <table class="pastors-pics">
                                <tr>
                                    <td colspan="5">
                                        <div id="sumanrani" class="pastor-link">
                                            <img src="graphics/SumanRani.png" /><br />
                                            <span>Ps SUMANTH & RANI PERUMALLA</span><br />
                                            <i><span style="font-size: 12pt;">(HOSTS)</span></i>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="width: 100%">
                                    <td style="width: 20%">
                                        <div id="danielkishore" class="pastor-link">
                                            <img src="graphics/DanielKishore.png" /><br />
                                            <span>Ps DANIEL KISHORE</span>
                                        </div>
                                    </td>
                                    <td style="width: 20%">
                                        <div id="rufusganta" class="pastor-link">
                                            <img src="graphics/Rufus.png" /><br />
                                            <span>Ps RUFUS GANTA</span>
                                        </div>
                                    </td>
                                    <td style="width: 20%">
                                        <div id="samsongandhi" class="pastor-link">
                                            <img src="graphics/SamsonGandhi.png" /><br />
                                            <span>Dr SAMSON GANDHI</span>
                                        </div>
                                    </td>
                                    <td style="width: 20%">
                                        <div id="benbuckley" class="pastor-link">
                                            <img src="graphics/BenBuckley.png" /><br />
                                            <span>Mr BEN BUCKLEY</span>
                                        </div>
                                    </td>
                                    <td style="width: 20%">
                                        <div id="samuelrufus" class="pastor-link">
                                            <img src="graphics/SamuelRufus.png" /><br />
                                            <span>Mr SAMUEL RUFUS</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="content-sessions" name="sessions">
                        <h1>
                            <span class="header">SESSIONS</span>
                        </h1>
                        <div class="content">
                            <div class="session-block">
                                <div></div>
                                <div class="session-Title">INFLUENCE - LEADERSHIP</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/Sumanth.png" />
                                </div>
                                <div class="session-Speaker">PS SUMANTH PERUMALLA</div>
                                <div class="session-description">David was in distress and was escaping to hide but in that hiding place, God used him for the distressed and was made Leader. God can use your situation to influence others.</div>
                                <div class="session-download"><a href="" class="no-resource">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/InfluenceLeadershipPsSumanthPerumallaInfluenceConference2013/Influence%20Leadership%20-%20Ps%20Sumanth%20Perumalla%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>
                            <div class="sermon-wrapper"></div>
                            <div class="session-block">
                                <div></div>
                                <div class="session-Title">THE CALL</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/Rufus.png" />
                                </div>
                                <div class="session-Speaker">PS RUFUS GANTA</div>
                                <div class="session-description">5 points on what calling is. Intersection of your talents, your heart desires and God's purpose is your calling.</div>
                                <div class="session-download"><a href="Resources/The Call.ppt">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/InfluenceLeadershipPsSumanthPerumallaInfluenceConference2013/The%20Call%20-%20Ps%20Rufus%20Ganta%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>
                            <div class="session-block">
                                <div></div>
                                <div class="session-Title">MANAGING FINANCES</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/SamuelRufus.png" />
                                </div>
                                <div class="session-Speaker">SAMUEL RUFUS</div>
                                <div class="session-description">Get out of debt. Budget your expenses. Tithe is a must. Offering to ministry because - "No money, No ministry". You have to look after your parents, so give them some money. Cut your credit cards, do not take personal loans, "You are will be Stupid Rich"</div>
                                <div class="session-download"><a href="" class="no-resource">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/InfluenceLeadershipPsSumanthPerumallaInfluenceConference2013/Managing%20Your%20Finances%20-%20Samuel%20Rufus%20Nallaraj%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch" data-id="5fU2EX1ez34">WATCH</div>
                            </div>
                            <div class="session-block">
                                <div></div>
                                <div class="session-Title">THE VOICE</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/BenBuckley.png" />
                                </div>
                                <div class="session-Speaker">BEN BUCKLEY</div>
                                <div class="session-description">Different ways God could speak to us. We must learn to hear God. Gives a clear picture on How God speaks, the ways God speaks to us and keys to hearing God consistently.</div>
                                <div class="session-download"><a href="Resources/The Voice.ppt">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/IntegrityDrSamsonGandhiInfluenceConference2013/TheVoice%20-%20Ben%20Buckley%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>

                            <div class="session-block">
                                <div>
                                    <div class="text"></div>
                                </div>
                                <div class="session-Title">Integrity</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/SamsonGandhi.png" />
                                </div>
                                <div class="session-Speaker">DR SAMSON GANDHI</div>
                                <div class="session-description">Integrity is choosing to think and behave based on Biblical values and not for personal gain.</div>
                                <div class="session-download"><a href="Resources/Integrity.pptx">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/IntegrityDrSamsonGandhiInfluenceConference2013/Integrity%20-%20Dr%20Samson%20Gandhi%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>


                            <div class="session-block">
                                <div>
                                    <div class="text"></div>
                                </div>
                                <div class="session-Title">LIVING YOUR DREAMS</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/Sumanth.png" />
                                </div>
                                <div class="session-Speaker">PS SUMANTH PERUMALLA</div>
                                <div class="session-description">Dreaming is one act and acting to acheive your dreams is another. Your vision for the future could be revealed by God through dreams.</div>
                                <div class="session-download"><a href="Resources/LivingYourDreams.docx">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/InfluenceLeadershipPsSumanthPerumallaInfluenceConference2013/Living%20Your%20Dreams%20-%20Ps%20Sumanth%20Perumalla%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>


                            <div class="session-block">
                                <div>
                                    <div class="text"></div>
                                </div>
                                <div class="session-Title">THE GREAT COMMISSION</div>
                                <div class="session-speakerPic">
                                    <img src="graphics/DanielKishore.png" />
                                </div>
                                <div class="session-Speaker">PS DANIEL KISHORE</div>
                                <div class="session-description">Daniel purposed in his heart not to defile himself. We ought to spread the gospel at our work places because the whole heavens are backing us up so that Jesus could be revealed through us.</div>
                                <div class="session-download"><a href="#" class="no-resource">RESOURCES</a></div>
                                <div class="session-listen"><a href="https://archive.org/download/InfluenceLeadershipPsSumanthPerumallaInfluenceConference2013/The%20Great%20Commission%20-%20Ps%20Daniel%20Kishore%20-%20Influence%20Conference%202013.wav">LISTEN</a></div>
                                <div class="session-watch no-video">WATCH</div>
                            </div>
                        </div>
                    </div>
                    <div id="content-contact" name="contact">
                        <h1>
                            <span class="header">FEEDBACK</span>
                        </h1>
                        <div class="content">
                            <br />
                            <br />
                            <div class="details">
                                We hope that you had a great time at the Influence Conference 2013. We would like to have your feedback and improve for the next year's conference.
                               <br />
                                WE WILL ONLY IMPROVE.
                            </div>
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
                    </div>
                    <!--<div id="content-">
                    <h1>SCHEDULE
                    </h1>
                    <div class="content">
                        This is where the content for the home page comes.
                    </div>
                </div>-->
                    <!--<div id="content-place">
                    <h1><span class="header">PLACE</span></h1>
                    <div class="content">
                        <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=royal+reve+hotel,+SD+Road&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=39.371738,86.572266&amp;ie=UTF8&amp;hq=royal+reve+hotel,+SD+Road&amp;ll=17.441466,78.499985&amp;spn=0.023214,0.042272&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=10420275403263293302&amp;output=embed"></iframe>
                        <br />
                        <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=royal+reve+hotel,+SD+Road&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=39.371738,86.572266&amp;ie=UTF8&amp;hq=royal+reve+hotel,+SD+Road&amp;ll=17.441466,78.499985&amp;spn=0.023214,0.042272&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=10420275403263293302" style="color: #0000FF; text-align: left">View Larger Map</a></small>
                    </div>
                </div>-->
                </td>
            </tr>
            <tr>
                <td>
                    <div class="footer">
                        <img src="graphics/churchLogo.png" />
                        <div class="church-address">
                            <span class="main">C3 Victory Secunderabad</span><br />
                            Plot No 90 P&T Colony<br />
                            Trimulgherry, Hyderabad - 500015
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <a class="register-now" id="register-now" href="contact">
            <span class="limited"><span style="color: #F33; position: relative; top: 1px; font-weight: bold" class="limited"></span>GIVE FEEDBACK&nbsp;</span></a>
        <div id="popup-wrap" align="center">
            <div class="popup-window">
                <div class="close-button" id="close-button">
                    X
                </div>
            </div>
        </div>
        <div class="bottom-message"></div>
    </form>
</body>
</html>
