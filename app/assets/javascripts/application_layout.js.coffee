$(document).ready ->
  $('input[name=search]').on 'keydown', (e) ->
    if e.keyCode == 13
      search = $('input[name=search]').val()
      window.location = "/search?search=" + search