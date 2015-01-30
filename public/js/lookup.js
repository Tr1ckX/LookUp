$(document).ready(function() {
  
  // Keep a record of device orientation
  // in body element at all times
  if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
      
      var angle_alpha = Math.round(event.alpha);
      var angle_beta = Math.round(event.beta);
      var angle_gamma = Math.round(event.gamma);
      
      if(angle_beta !== null) {
        $('body').attr("data-angle-beta", angle_beta);
        
        // On angle.erb, set angle
        $('#dataContainerOrientation').html(Math.abs(angle_beta) + '°');
      }
      
      if(angle_alpha !== null) {
        $('body').attr("data-angle-alpha", angle_alpha);
      }
      
      if(angle_gamma !== null) {
        $('body').attr("data-angle-gamma", angle_gamma);
      }
      
    }, false);
  }
  
  $('#capture').click(function(){
    $('#capture_hidden').attr('value', Math.abs(parseInt($('body').attr("data-angle-beta"))));
  });
  
  // Add selected class to 
  // clicked material icons
  $('.material_icon').click(function() {
    $('.material_icon').removeClass('selected');
    $(this).addClass('selected');
    $('#material-input').val($.trim($(this).text()));
  });
  
  // Update shade percent on slider change
  $('#shader').change(function() {
    $('#shade').text($(this).val() + "%");
  });
  
  var shader_interval;
  
  $('body').on("touchstart", "#shader", function() {
    var el = $(this);
    shader_interval = setInterval(function() {
      $('#shade').text(el.val() + "%");
    }, 50);
  });

  $('body').on("touchend", "#shader", function() {
    clearInterval(shader_interval);
  });
  
  // Home page magic with clouds
  $('.page.home').each(function() {
    $('.para').data("start", 0);
    $('.para').data("depth", 2);
    
    var el = $(this);
    addCloud(240, -35, el, 1);
    addCloud(-70, 60, el, 2);
    addCloud(145, 130, el, 2);
    addCloud(190, 110, el, 3);
    addCloud(-25, 30, el, 3);
    
    setInterval(function() {
      var angle = parseInt($('body').attr('data-angle-gamma'));
      $('.cloud, .para').each(function() {
        $(this).css("left", $(this).data("start") + (angle * (1/$(this).data("depth"))));
      });
      
    }, 10);
  });
  
  function addCloud(left, top, parent, layer) {
    var cloud = $('<div class="cloud"></div>');
    cloud.css('left', left);
    cloud.css('top', top);
    cloud.css('z-index', "-" + layer);
    cloud.addClass('layer-' + layer);
    cloud.data("start", left);
    cloud.data("depth", layer);
    parent.append(cloud);
  }
  
});