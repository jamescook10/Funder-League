$(function(){
        var data = [
            {
              value: 30,
              color:"#F38630",
              label : 'Sleep',
            },
            {
              value : 50,
              color : "#E0E4CC",
              label : 'Sleep',
            },
            {
              value : 100,
              color : "#69D2E7",
              label : 'Sleep',
              labelColor : 'white'
            }     
          ]

          var ctx = document.getElementById("canvas3").getContext('2d');
          console.log(ctx)
          var myNewChart = new Chart(ctx).Pie(data, {labelFontSize: '14'});
  
          })
