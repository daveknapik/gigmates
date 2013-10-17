$ ->
  $("#search-form").on
    "ajax:beforeSend": (e, xhr, settings) ->
      console.log e
      console.log xhr
      console.log settings
    "ajax:success": (e, data, status, xhr) ->
      console.log e
      console.log data
      console.log status
      console.log xhr
    "ajax:complete": (e, xhr, status) ->
      console.log e
      console.log xhr
      console.log status
    "ajax:error": (e, xhr, status, error) ->
      console.log e
      console.log xhr
      console.log status
      console.log error