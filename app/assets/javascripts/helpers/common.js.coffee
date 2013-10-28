Rails4Bp.Common =
  loadListBindings: ->
    console.log 'I am from commonjs'
    #full screen btn
    $(".layout-btns .layout-full").click (e) ->
      if $(this).hasClass("active")
        $("#sidebar-region").show "fast"
        $("#content-block").removeClass("col-md-12 col-sm-12 full-content").addClass "col-md-10 col-sm-11"
      else
        $("#sidebar-region").hide "fast"
        $("#content-block").removeClass("col-md-10 col-sm-11").addClass "col-md-12 col-sm-12 full-content"


    # g-search
    $("#g-search .dropdown-menu a").click ->
      $("#g-search").attr("action", $(this).data("action")).submit()

    $(".layout-btns .layout-normal").click (e) ->
      $("#grid table").removeClass "table-condensed"

    $(".layout-btns .layout-condensed").click (e) ->
      $("#grid table").addClass "table-condensed"


