$( document ).ready(function() {
  label = words_to_time($('#post_content').text().split(" "))
  $('h1#post_title').append('<span class="time_to_read">' + label + ' to read this drivel</span>')

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
