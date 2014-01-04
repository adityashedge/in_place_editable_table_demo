# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('body').on 'click', '#create_btn', ->
    $('#create_album_form').closest('tr').show()
  $('body').on 'click', '.cancel_btn', ->
    $('#create_album_form').closest('tr').hide()
#replace content in tr with input and add original value in input fields
  $('body').on 'click', '.edit_btn', ->
    $(this).closest('tr').children('td:not(:last)').each ->
      cell_value = $.trim($(this).text())
      $(this).html("<input class='input-small' type='text' size='30'></input>")
      $(this).children('input').val(cell_value)
    $(this).removeClass('edit_btn')
    $(this).addClass('save_btn')
    $(this).text('Save')
#get data from input fields and prepare params and send ajax request for update
  $('body').on 'click', '.save_btn', ->
    id = $(this).closest("tr").attr('data-id') 
    params_hash = "id=" + id + "&"
    $(this).closest('tr').children('td:not(:last)').each ->
      cell_value = $.trim($(this).children("input").val())
      index = $(this).closest("tr").children("td").index($(this)) + 1
      key = $("#album_table table").find("th:nth-child(" + index + ")").text().toLowerCase()
      params_hash += "album["+key+"]="+cell_value+"&"
    $.ajax({
      type: 'PUT'
      url: '/albums/'+id
      data: params_hash
    })
