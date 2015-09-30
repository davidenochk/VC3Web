$(document).ready(function () {
    /* ---- Countdown timer ---- */
    $('#counter').countdown({
        timestamp: (new Date()).getTime() + 23 * 08 * 32 * 60 * 1000
    });
});

