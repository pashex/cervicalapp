// page init
jQuery(function(){
    initNavOpener();
    initScroll2();
    hideMenuAfterClick();
});

function initNavOpener(){
    jQuery('.opener-nav') .click(
        function(){
            jQuery('.navigation-block') .toggleClass('expanded');
        }
    ) 
}

function hideMenuAfterClick() {
    if($(window).width() < 992) {
        $('.navigation a').on('click', function() {
            $('.navigation-block').removeClass('expanded');
        })
    }
}

function initScroll2(){
    $(window).scroll(function(){
        var window_top = $(window).scrollTop() - 50; // the "12" should equal the margin-top value for nav.stick
        var div_top = $('#nav-anchor').offset().top;
            if (window_top > div_top) {
                $('#nav').addClass('stick');
                // $('#wrapper').addClass('stick2');
            } else {
                $('#nav').removeClass('stick');
                // $('#wrapper').removeClass('stick2');
            }

    });
    /**
     * This part causes smooth scrolling using scrollto.js
     * We target all a tags inside the nav, and apply the scrollto.js to it.
     */
    
    /**
     * This part handles the highlighting functionality.
     * We use the scroll functionality again, some array creation and 
     * manipulation, class adding and class removing, and conditional testing
     */
    var aChildren = $(".navigation li>a"); // find the a children of the list items
    var aArray = []; // create the empty aArray
    for (var i=0; i < aChildren.length; i++) {    
        var aChild = aChildren[i];
        var ahref = $(aChild).attr('href');
        aArray.push(ahref);
    } // this for loop fills the aArray with attribute href values
    
    $(window).scroll(function(){
        var windowPos = $(window).scrollTop(); // get the offset of the window from the top of page
        var windowHeight = $(window).height(); // get the height of the window
        var docHeight = $(document).height();
        
        for (var i=0; i < aArray.length; i++) {
            var theID = aArray[i];
            var divPos = $(theID).offset().top - 50; // get the offset of the div from the top of page
            var divHeight = $(theID).height(); // get the height of the div in question
            if (windowPos >= divPos && windowPos < (divPos + divHeight)) {
                $("a[href='" + theID + "']").addClass("active");
            } else {
                $("a[href='" + theID + "']").removeClass("active");
            }
            // if('.navigation a') .hasClass('active')
        }
        
        if(windowPos + windowHeight == docHeight) {
            if (!$(".navigation li:last-child a").hasClass("active")) {
                var navActiveCurrent = $(".active").attr("href");
                $("a[href='" + navActiveCurrent + "']").removeClass("active");
                $(".navigation li:last-child a").addClass("active");
            }
        }
    });

}

