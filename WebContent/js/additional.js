 $(function () {

                $('.additional-btn >.additional-icon >#chevron').click(
                    function () {
                        //show its submenu
                        if ($('#horizontal-form').hasClass("collapse in")) {
                            $('#horizontal-form').removeClass("collapse in");
                            $('#horizontal-form').hide(800, function () {
                                $('#horizontal-form').addClass("collapse");
                            });
                        } else {
                        	if ($('#horizontal-form').hasClass("collapse")) {
                            $('#horizontal-form').removeClass("collapse");
                            $('#horizontal-form').show(800, function () {
                                $('#horizontal-form').addClass("collapse in");
                            });

                        }
                        }
                    });
            });
 $(function () {

     $('.additional-btn >.additional-icon >#chevron1').click(
         function (e) {
             //show its submenu
             if ($('#horizontal-form1').hasClass("collapse in")) {
                 $('#horizontal-form1').removeClass("collapse in");
                 $('#horizontal-form1').hide(800, function () {
                     $('#horizontal-form1').addClass("collapse");
                 });

             } else {
                 $('#horizontal-form1').removeClass("collapse");
                 $('#horizontal-form1').show(800, function () {
                     $('#horizontal-form1').addClass("collapse in");
                 });

             }

         });
 });
 $(function () {

     $('.additional-btn >.additional-icon >#chevron2').click(
         function (e) {

             //show its submenu
             if ($('#horizontal-form2').hasClass("collapse in")) {
                 $('#horizontal-form2').removeClass("collapse in");
                 $('#horizontal-form2').hide(800, function () {
                     $('#horizontal-form2').addClass("collapse");
                 });
             } else {
                 $('#horizontal-form2').removeClass("collapse");
                 $('#horizontal-form2').show(800, function () {
                     $('#horizontal-form2').addClass("collapse in");
                 });

             }

         });
 });  
            $(function () {
                $("#button").click(function () {
                    if ($("#form1").valid()) {
                    
                        if ($('#horizontal-form').hasClass("collapse in")) {
                            $('#horizontal-form').removeClass("collapse in");
                            $('#horizontal-form').hide(800, function () {
                                $('#horizontal-form').addClass("collapse");
                            });
                        }
                        $("#form1").submit();
                    }
                    if($("#form2").valid()){
                        if ($('#horizontal-form1').hasClass("collapse in")) {
                            $('#horizontal-form1').removeClass("collapse in");
                            $('#horizontal-form1').hide(800, function () {
                                $('#horizontal-form1').addClass("collapse");
                            });

                        }
                        $("#form2").submit();
                    }
                
                });
            });

  

