function clear_gif_row(){
  $('.clear').remove()
  $('#gif_grid div:nth-child(6n)').after('<div class="clear"></div>')
}

function drop_last_gif(){
  $('#gif_grid div').last().remove()
}

$( document ).ready( function(){
  clear_gif_row()
})
