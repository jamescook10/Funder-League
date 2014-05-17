# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# data = $("canvas").data('scores')


jQuery ->

  data = [{
    label: 'Pool',
    value: 30.0,
    color:"#F7464A"
  },
  {
    label: 'HELLO',
    value : 40.0,
    color : "#E2EAE9"
  },
  {
    label: 'HELLO',
    value : 50.7,
    color : "#D4CCC5"
  },
  {
    label: 'HELLO',
    value : 90.4,
    color : "#949FB1"
  },
  ]
  
  myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Pie(data, {labelFontSize: '16'});


jQuery ->

  data = [{
    value : 100,
    color : "#F38630"
  },
  {
    value : 10,
    color : "#E2EAE9"
  },
  {
    value : 60,
    color : "#D4CCC5"
  },
  {
    value : 100,
    color : "#949FB1"
  },
  ]

  myNewChart = new Chart($("#canvas2").get(0).getContext("2d")).Doughnut(data);







