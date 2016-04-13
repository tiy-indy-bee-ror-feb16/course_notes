$( document ).ready(function() {
  label = words_to_time($('#post_content').text().split(" "))
  $('h1#post_title').append('<span class="time_to_read">' + label + ' to read this drivel</span>')

  // New post form validation
  $('form#new_post').submit(function(ev){
    if(($('#post_title').val().length == 0) || ($('#post_body').val().length == 0)){
        ev.preventDefault()
        if($('#post_title').val().length == 0){
          $('.post_title').addClass('has-error')
          if(!$('.post_title span.help-block').get(0)){
            $('.post_title').append('<span class="help-block">can\'t be blank</span>')
          }
        }else{
          $('.post_title').removeClass('has-error')
          $('.post_title span.help-block').remove()
        }
        if($('#post_body').val().length == 0){
          $('.post_body').addClass('has-error')
          if(!$('.post_body span.help-block').get(0)){
            $('.post_body').append('<span class="help-block">can\'t be blank</span>')
          }
        }else{
          $('.post_body').removeClass('has-error')
          $('.post_body span.help-block').remove()
        }
    }
  })
})

function words_to_time(words) {
  seconds = words.length / (230/60)
  return seconds_to_minutes(seconds)
}

function seconds_to_minutes(seconds) {
  these_seconds = seconds % 60
  minutes = (seconds - these_seconds)/60
  return pluralize("minute", minutes) + " and " + Math.round(these_seconds) + " seconds"
}

function pluralize(word, num) {
  if(num == 1) {
    return num + " " + word
  }else{
    return num + " " + (word[-1] == 's' ? word + "es" : word + "s")
  }
}
