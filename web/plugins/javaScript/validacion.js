
$(document).ready(function () {
    $("#formSoli").validate({
        rules: {
            nombre: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            documento: {
                required: true,
                minlength: 8,
                maxlength: 18
            },
            tel: {
                required: true,
                minlength: 9,
                maxlength: 12
            },
            direccion: {
                required: true,
                minlength: 10,
                maxlength: 20
            },
            correo: {
                required: true,
                minlength: 15,
                maxlength: 25
            },
            descripcion: {
                required: true,
                minlength: 15,
                maxlength: 25
            },
            recoger: {
                required: true
            },
            entrega: {
                required: true

            }
        },
        messages: {
            nombre: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            documento: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            tel: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            direccion: {
                required: "Campo obligatorio",
                minlength: "Muy corto.",
                maxlength: "Excede el limite"
            },
            correo: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"

            },
            descripcion: {
                required: "Campo obligatorio",
                minlength: "Muy corto",
                maxlength: "Excede el limite"
            },
            recoger: {
                required: "Campo obligatorio"


            },
            entrega: {
                required: "Campo obligatorio"

            }
        }

    });
});