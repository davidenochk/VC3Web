<%@ Page Title="" Language="C#" MasterPageFile="../main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentation_Connect_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.volunteer-submit').click(function () {
                $('.volunteer-form input[type="text"]').val('');
            });
            $('.volunteer-form input[type="submit"]').click(function () {
                $(this).val('Sending...').css('background-color', 'red');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="scrptmngr" runat="server"></asp:ScriptManager>
    <div style="position: relative; height: auto;">
    </div>
</asp:Content>

