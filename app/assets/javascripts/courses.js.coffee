$ ->
  $(".novel").hoverIntent (->
    $(this).children("div.notes").slideToggle 400
  ), ->
    $(this).children("div.notes").slideToggle 400
  
  $("input[type=text]").keyup ->
    $(this).closest("form").submit()
    
  $("input[type=checkbox]").click ->
    $(this).closest("form").submit()
    

