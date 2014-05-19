// $(function(){
//         var data = [
//             {
//               value: 30,
//               color:"#F38630",
//               label : 'Sleep',
//             },
//             {
//               value : 50,
//               color : "#E0E4CC",
//               label : 'Sleep',
//             },
//             {
//               value : 100,
//               color : "#69D2E7",
//               label : 'Sleep',
//               labelColor : 'white'
//             }     
//           ]

//           var ctx = document.getElementById("canvas3").getContext('2d');
//           console.log(ctx)
//           var myNewChart = new Chart(ctx).Pie(data, {labelFontSize: '14'});
  
//           })

var games_played = function(status) {

  if (status) {
    console.log("Games Played Chart: On")

    // Grab data from Rails
    games_played = $("#games-played").data('games-played');

    // Convert Games Played data from object to array for use in chart
    var game_data = $.map(games_played, function(value, index) {
        return [value];
    });

    // Set the canvas for the chart
    var ctx = $("#games-played canvas").get(0).getContext("2d");

    // Create new chart object
    var chart = new Chart(ctx);

    options = {
      //Boolean - Whether we should show a stroke on each segment
        segmentShowStroke : true,
        
        //String - The colour of each segment stroke
        segmentStrokeColor : "#fff",
        
        //Number - The width of each segment stroke
        segmentStrokeWidth : 2,
        
        //The percentage of the chart that we cut out of the middle.
        percentageInnerCutout : 40,
        
        //Boolean - Whether we should animate the chart 
        animation : true,
        
        //Number - Amount of animation steps
        animationSteps : 100,
        
        //String - Animation easing effect
        animationEasing : "easeInOutCubic",
        
        //Boolean - Whether we animate the rotation of the Doughnut
        animateRotate : true,

        //Boolean - Whether we animate scaling the Doughnut from the centre
        animateScale : false,
        
        //Function - Will fire on animation completion.
        onAnimationComplete : null
    }

    // Use Doughnut chart
    chart.Doughnut(game_data, options);

  } else {
    console.log("Games Played Chart: Off")
  }
  };

  var win_percentage = function(game_type, status) {

    if (status) {
      console.log(game_type + " Win % Chart: On");

      // Grab data from Rails
      percentage = $(".game." + game_type + "-charts" + " #win-percentage").data('percentages');

      // Convert Games Played data from object to array for use in chart
      var win_percentage_data = $.map(percentage, function(value, index) {
          return [value];
      });


      // Set the canvas for the chart
      var ctx = $(".game." + game_type + "-charts" + " #win-percentage canvas").get(0).getContext("2d");

      // Create new chart object
      var chart = new Chart(ctx);

      options = {
        //Boolean - Whether we should show a stroke on each segment
          segmentShowStroke : true,
          
          //String - The colour of each segment stroke
          segmentStrokeColor : "#fff",
          
          //Number - The width of each segment stroke
          segmentStrokeWidth : 2,
          
          //The percentage of the chart that we cut out of the middle.
          percentageInnerCutout : 50,
          
          //Boolean - Whether we should animate the chart 
          animation : true,
          
          //Number - Amount of animation steps
          animationSteps : 100,
          
          //String - Animation easing effect
          animationEasing : "easeInOutCubic",
          
          //Boolean - Whether we animate the rotation of the Doughnut
          animateRotate : true,

          //Boolean - Whether we animate scaling the Doughnut from the centre
          animateScale : false,
          
          //Function - Will fire on animation completion.
          onAnimationComplete : null
      };

      // Use Doughnut chart
      chart.Pie(win_percentage_data, options);

    } else {
      console.log("Games Played Chart: Off")
    }
    };
