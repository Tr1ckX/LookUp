function gyroscope() {

  var angle;

  var dataContainerOrientation = document.getElementById('dataContainerOrientation');
    if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
      
    angle = Math.abs(Math.round(event.beta));

    if(angle !== null); 
    dataContainerOrientation.innerHTML = 'Roof angle: ' + angle + ' degrees';
    }, false);

    $('#capture').click(function(){
      $('#capture_hidden').attr('value', angle);
    });
  }
}
