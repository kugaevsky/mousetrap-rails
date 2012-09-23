$ ->
  # Hotkey binding to links with 'data-keybindings' attribute
  # Navigate link when hotkey pressed
  $('a[data-keybinding]').each (i, el) ->
    Mousetrap.bind $(el).data('keybinding'), (e) -> el.click()

  # Hotkey binding to inputs with 'data-keybindings' attribute
  # Focus input when hotkey pressed
  $('input[data-keybinding]').each (i, el) ->
    Mousetrap.bind $(el).data('keybinding'), (e) ->
      el.focus()
      if e.preventDefault
        e.preventDefault()
      else
        e.returnValue = false
