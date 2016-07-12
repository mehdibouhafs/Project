 $(function () {

                $('#sidebar-menu >ul >li').click(
                    function () {
                        //show its submenu
                        if ($(this).hasClass('selected')) {
                            $(this).removeClass("selected");
                            $('ul', this).slideUp(200);
                        } else {
                            $(this).removeClass("selected");
                            $('ul', this).slideUp(200);
                            if ($('ul', this).length) {
                                $(this).addClass("selected");
                                $('ul', this).slideDown(200);
                            }
                        }

                    });
            });
