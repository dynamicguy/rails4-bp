$initPage = function () {
    $('input.search-query').typeahead({
        items:10,
        source:function (query, process) {
            return $.get('/persons/typeahead.json', { query:query }, function (data) {
                return process(data.options);
            });
        }
    });
    $(window).resize(); //on page load

    $('.bottom_tooltip').tooltip({
        placement:'bottom'
    });
    $('.left_tooltip').tooltip({
        placement:'left'
    });
    $('.right_tooltip').tooltip({
        placement:'right'
    });
    $('.top_tooltip').tooltip();
    $('textarea.text').wysihtml5();
    $('[data-toggle="dropdown"]').dropdown();
    $('.accordion-body.collapse.in').prev('.accordion-heading').addClass('acc-active');
    $('.accordion-heading').click(function () {
        $('.accordion-heading').removeClass('acc-active');
        $(this).addClass('acc-active');
    });

    $('.modal-header a.close').click(function (e) {
        e.preventDefault();
        $('.modal').modal('hide');
        return false;
    });

    $('#invitation_button').click(function () {
        var email = $('form #user_email').val();
        var opt_in = false;
        if (!$('form #user_opt_in').is(':checked')) {
            opt_in = false;
        }
        var dataString = 'user[email]=' + email + '&user[opt_in]=' + opt_in;
        $.ajax({
            type:"POST",
            url:"/persons",
            data:dataString,
            success:function (data) {
                $('#request-invite').html(data);
            }
        });
        return false;
    });

//    $(".chzn-select").chosen();
//    $(".chzn-select-deselect").chosen({allow_single_deselect:true});

    $('li.search-field input').keyup(function () {
        var q = $(this).val();
        $.get('/persons/tags.json', { query:q }, function (data) {
            process_tags(q, data);
        });
    });

    var process_tags = function (q, data) {
        //$('.chzn-select').children().remove();
        $.each(data, function (i, item) {
            if ($(".chzn-select").find("option[value=" + item.name + "]").length == 0)
                $(".chzn-select").prepend('<option value="' + item.name + '">' + item.name + '</option>');
        });
        $(".chzn-select").trigger("liszt:updated");
        $('li.search-field input').val(q);
    };

    if ($('.datatable').length > 0) {
        if ($('.datatable.ajaxed').length > 0) {
            $('.datatable.ajaxed').dataTable({
                "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType":"bootstrap",
                "aoColumnDefs":[
                    { 'bSortable':false, 'aTargets':[ -1, 0 ] }
                ],
                "bProcessing":true,
                "bServerSide":true,
                "oLanguage":{
                    "sProcessing":'<div class="progress active progress-info progress-striped no-border" style="height: 10px;"> <div class="bar" style="width: 100%"></div> </div>'
                },
                "sAjaxSource":$('.datatable').data('source')
            });
        } else {
            $('.datatable').dataTable({
                "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType":"bootstrap",
                "aoColumnDefs":[
                    { 'bSortable':false, 'aTargets':[ -1, 0 ] }
                ]
            });
        }

        $("table.datatable input.toggle").click(function () {
            return $("table [name='bulk_ids[]']").attr("checked", $(this).is(":checked"));
        });
    }


    if ($('.datepicker').length > 0) {
        $('.datepicker').datepicker({
            todayBtn:'linked',
            todayHighlight:true,
            autoclose:true
        });
    }

    if ($('.best_in_place').length > 0) {
        $('.best_in_place').bind("ajax:success", function () {
            var originalColor = $(this).closest('p').css("background-color");
            console.log(originalColor);
            $(this).closest('p').css("background-color", "#fff0aa")
                .addClass("alert alert-success")
                .animate({
                    background:['fade', 'swing']
                }, 1000, 'linear', function () {
                    $(this).css("background-color", originalColor);
                });
        });
        $('.best_in_place').best_in_place();
    }

    $('.alert-message .close').click(function () {
        $(this).parent().parent('.c-alert').fadeOut('slow');
    });

    if (typeof bindPageEvents == 'function') {
        bindPageEvents();
    }

};

$(function () {
    $initPage();
});

$(window).resize(function () {
    $('body').addClass(navigator.platform)
    var height = $(this).height() - $(".navbar").height() + $(".footer").height();
    $('body').css('min-height', height);
});

document.addEventListener("page:fetch", function () {
    document.getElementById('progress-bar').style.display = 'block';
});

document.addEventListener("page:change", function () {
    document.getElementById('progress-bar').style.display = 'none';
});