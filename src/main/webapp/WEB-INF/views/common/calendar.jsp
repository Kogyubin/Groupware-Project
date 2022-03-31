<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/assets/js/fullcalendar/lib/main.css" rel="stylesheet" />
    <script src="resources/assets/js/fullcalendar/lib/main.js"></script>
    <script src="resources/assets/jsfullcalendar/lib/locales/ko.js"></script>
    
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
      
      
      var calendar = new Calendar(calendarEl, {
    	  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
    	  header: {
    	    left: 'prev,next today',
    	    center: 'title',
    	    right: 'dayGridMonth,timeGridWeek,timeGridDay'
    	  },
    	  editable: true,
    	  droppable: true, // this allows things to be dropped onto the calendar
    	  drop: function(info) {
    	    // is the "remove after drop" checkbox checked?
    	    if (checkbox.checked) {
    	      // if so, remove the element from the "Draggable Events" list
    	      info.draggedEl.parentNode.removeChild(info.draggedEl);
    	    }
    	  },
    	  locale: 'ko'
    	});

      var calendar = new Calendar(calendarEl, {
    	  dateClick: function() {
    	    alert('a day has been clicked!');
    	  }
    	});
      
      
      calendar.on('dateClick', function(info) {
    	  console.log('clicked on ' + info.dateStr);
    	});


    </script>
  </head>
  <body>
    <div id="calendar"></div>
  </body>
</html>