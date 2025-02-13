// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'select2';
import 'select2/dist/css/select2.css';
import Chart from 'chart.js/auto';
import * as d3 from 'd3';
window.Chart = Chart; // Make Chart globally available
// Initialize Select2 on the select element
document.addEventListener('DOMContentLoaded', () => {
  $('.player-select').select2({
    placeholder: 'Select a player',
    allowClear: true,
  });
});

// app/javascript/packs/application.js

// app/javascript/packs/application.js

document.addEventListener('DOMContentLoaded', function() {
    // Hardcoded fill colors for testing
    var fillColors = {
      left: 'red',
      center: 'green',
      right: 'blue'
    };
  
    ['left', 'center', 'right'].forEach(function(side) {
      var group = document.getElementById(side);
      if (group) {
        group.setAttribute('fill', fillColors[side]);
      } else {
        console.warn('Group with id "' + side + '" not found in SVG.');
      }
    });
  });