# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  
ready =->
  $('select#profile_country_residence').change (event) ->
    select_wrapper = $('#profile_city_wrapper')

    $('select', select_wrapper).attr('disabled', true)

    country_residence = $(this).val()

    url = "/subregion_options?parent_region=#{country_residence}"
    select_wrapper.load(url)
    
$(document).ready(ready);
$(document).on('page:load', ready)