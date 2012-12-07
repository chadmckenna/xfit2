$ ->
  $('#graphBenchmark').click ->
    $('table').visualize(height: 500, colors: ['#ccc'], title: $('#title').text())