$(document).ready(function(){

  var current_process_step = 0
  var max_process_step     = $('.process-step').length

  $(document).on('keyup', function(ev){
    // left: 37, right: 39
    if(ev.which == 37 || ev.which == 39) {
      ev.preventDefault()
      if(ev.which == 37)
        prev_step()
      if(ev.which == 39)
        next_step()

      switch_step()
    }
  })

  $('.prev-step').on('click', function(){
    prev_step()
    switch_step()
  })

  $('.next-step').on('click', function(){
    next_step()
    switch_step()
  })

  function prev_step() {
    if(current_process_step > 0)
      current_process_step -= 1
  }

  function next_step() {
    if(current_process_step < max_process_step - 1)
      current_process_step += 1
  }

  function switch_step() {
    $('.process-step, .process-panel').
      removeClass('selected').
      filter("[data-step="+current_process_step+"]").
      addClass('selected')
  }

})
