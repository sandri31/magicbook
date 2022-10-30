// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import "popper"
import "bootstrap"

import "controllers"

// Modal white in page construction
document.addEventListener('DOMContentLoaded', function() {
  var sUrlVideoAccueil = document.getElementById('oVideoYouTubeiFrameWhite').getAttribute('src');
  var oModalYouTubeElement = document.getElementById('oModalYouTubeWhite');
  oModalYouTubeElement.addEventListener('hide.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameWhite').setAttribute('src', '');
  })
  var oModalYouTubeElement = document.getElementById('oModalYouTubeWhite');
  oModalYouTubeElement.addEventListener('show.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameWhite').setAttribute('src', sUrlVideoAccueil);
  })
});
// Modal blue in page construction
document.addEventListener('DOMContentLoaded', function() {
  var sUrlVideoAccueil = document.getElementById('oVideoYouTubeiFrameBlue').getAttribute('src');
  var oModalYouTubeElement = document.getElementById('oModalYouTubeBlue');
  oModalYouTubeElement.addEventListener('hide.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameBlue').setAttribute('src', '');
  })
  var oModalYouTubeElement = document.getElementById('oModalYouTubeBlue');
  oModalYouTubeElement.addEventListener('show.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameBlue').setAttribute('src', sUrlVideoAccueil);
  })
});
// Modal black in page construction
document.addEventListener('DOMContentLoaded', function() {
  var sUrlVideoAccueil = document.getElementById('oVideoYouTubeiFrameBlack').getAttribute('src');
  var oModalYouTubeElement = document.getElementById('oModalYouTubeBlack');
  oModalYouTubeElement.addEventListener('hide.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameBlack').setAttribute('src', '');
  })
  var oModalYouTubeElement = document.getElementById('oModalYouTubeBlack');
  oModalYouTubeElement.addEventListener('show.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameBlack').setAttribute('src', sUrlVideoAccueil);
  })
});
// Modal red in page construction
document.addEventListener('DOMContentLoaded', function() {
  var sUrlVideoAccueil = document.getElementById('oVideoYouTubeiFrameRed').getAttribute('src');
  var oModalYouTubeElement = document.getElementById('oModalYouTubeRed');
  oModalYouTubeElement.addEventListener('hide.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameRed').setAttribute('src', '');
  })
  var oModalYouTubeElement = document.getElementById('oModalYouTubeRed');
  oModalYouTubeElement.addEventListener('show.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameRed').setAttribute('src', sUrlVideoAccueil);
  })
});
// Modal green in page construction
document.addEventListener('DOMContentLoaded', function() {
  var sUrlVideoAccueil = document.getElementById('oVideoYouTubeiFrameGreen').getAttribute('src');
  var oModalYouTubeElement = document.getElementById('oModalYouTubeGreen');
  oModalYouTubeElement.addEventListener('hide.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameGreen').setAttribute('src', '');
  })
  var oModalYouTubeElement = document.getElementById('oModalYouTubeGreen');
  oModalYouTubeElement.addEventListener('show.bs.modal', function (event) {
    document.getElementById('oVideoYouTubeiFrameGreen').setAttribute('src', sUrlVideoAccueil);
  })
});
