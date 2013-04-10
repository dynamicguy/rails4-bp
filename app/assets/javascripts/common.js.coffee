App =
  run: ->
    $('input.toggle').click ->
      $('input.toggle').closest("table").find("input[name='bulk_ids[]']").attr "checked", $(this).is(":checked")

    #$("table [name='bulk_ids[]']").attr "checked", $(this).is(":checked")

    $("input.search-query").typeahead
      items: 10
      source: (query, process) ->
        $.get "/persons/typeahead.json",
              query: query
        , (data) ->
          process data.options

    #    $(window).resize()
    $(".bottom_tooltip").tooltip placement: "bottom"
    $(".left_tooltip").tooltip placement: "left"
    $(".right_tooltip").tooltip placement: "right"
    $(".top_tooltip").tooltip()
    $("textarea.text").wysihtml5()
    $("[data-toggle=\"dropdown\"]").dropdown()
    $(".accordion-body.collapse.in").prev(".accordion-heading").addClass "acc-active"
    $(".accordion-heading").click ->
      $(".accordion-heading").removeClass "acc-active"
      $(this).addClass "acc-active"

    $(".modal-header a.close").click (e) ->
      e.preventDefault()
      $(".modal").modal "hide"
      false

    $("#invitation_button").click ->
      email = $("form #user_email").val()
      opt_in = false
      opt_in = false  unless $("form #user_opt_in").is(":checked")
      dataString = "user[email]=" + email + "&user[opt_in]=" + opt_in
      $.ajax
        type: "POST"
        url: "/persons"
        data: dataString
        success: (data) ->
          $("#request-invite").html data

      false

    $("li.search-field input").keyup ->
      q = $(this).val()
      $.get "/persons/tags.json",
            query: q
      , (data) ->
        process_tags q, data

    process_tags = (q, data) ->
      $.each data, (i, item) ->
        $(".chzn-select").prepend "<option value=\"" + item.name + "\">" + item.name + "</option>"  if $(".chzn-select").find("option[value=" + item.name + "]").length is 0

      $(".chzn-select").trigger "liszt:updated"
      $("li.search-field input").val q

    if $(".datatable").length > 0
      if $(".datatable.ajaxed").length > 0
        $(".datatable.ajaxed").dataTable
          sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
          sPaginationType: "bootstrap"
          aoColumnDefs: [
            bSortable: false
            aTargets: [ -1, 0 ]
          ]
          bProcessing: true
          bServerSide: true
          oLanguage:
            sProcessing: "<div class=\"progress active progress-info progress-striped no-border\" style=\"height: 10px;\"> <div class=\"bar\" style=\"width: 100%\"></div> </div>"

          sAjaxSource: $(".datatable").data("source")
      else
        $(".datatable").dataTable
          sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
          sPaginationType: "bootstrap"
          aoColumnDefs: [
            bSortable: false
            aTargets: [ -1, 0 ]
          ]

    if $(".datepicker").length > 0
      $(".datepicker").datepicker
        todayBtn: "linked"
        todayHighlight: true
        autoclose: true

    if $(".best_in_place").length > 0
      $(".best_in_place").bind "ajax:success", ->
        originalColor = $(this).closest("p").css("background-color")
        console.log originalColor
        $(this).closest("p").css("background-color", "#fff0aa").addClass("alert alert-success").animate
          background: [ "fade", "swing" ]
        , 1000, "linear", ->
          $(this).css "background-color", originalColor

      $(".best_in_place").best_in_place()

    $(".alert-message .close").click ->
      $(this).parent().parent(".c-alert").fadeOut "slow"

    bindPageEvents()  if typeof bindPageEvents is "function"

    $(window).resize ->
      $("body").addClass navigator.platform
      height = $(this).height() - $(".navbar").height() + $(".footer").height()
      $("body").css "min-height", height

$ ->
  App.run()

  document.addEventListener "page:fetch", ->
    document.getElementById("progress-bar").style.display = "block"

  document.addEventListener "page:change", ->
    document.getElementById("progress-bar").style.display = "none"