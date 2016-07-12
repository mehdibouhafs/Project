jQuery.validator.addMethod("phone", function (phone_number, element) {
                phone_number = phone_number.replace(/\s+/g, "");
                return this.optional(element) || phone_number.length > 9 && phone_number.match(/^[0-9-+]+$/);
            }, "Please specify a valid phone number");


            $(function () {
                $('#form1').validate({
                    rules: {
                        cin: {
                            minlength: 8,
                            required: true
                        },
                        nom: {
                            minlength: 3,
                            maxlength: 15,
                            required: true
                        },
                        prenom: {
                            minlength: 3,
                            maxlength: 15,
                            required: true
                        },
                        email: {
                            required: true
                        },
                        tel: {
                            phone: true,
                            required: true
                        },
                        dateNaissance: {
                            maxDate: true
                        },
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });

            });
        function show_form2(){
                
                $('#form1').hide(200);
                $('#form2').show(300);
        }
        function show_form1(){
            
                $('#form2').hide(200);
            $('#form3').hide(200);
                $('#form1').show(300);
        }
        function show_form3(){
              $('#form1').hide(200);
              $('#form3').show(300);
        }