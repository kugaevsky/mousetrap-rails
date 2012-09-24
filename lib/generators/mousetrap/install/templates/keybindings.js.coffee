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

  # Show/hide hotkey hints for mousetrap
  window.mouseTrapRails =
    keysShown: false            # Show/hide hotkey hints by default (on page load)
    toggleKeys: 'm t h'         # Key sequence to toggle hints visibility
    toggleHints:  ->
      $('a[data-keybinding]').each (i, el) ->
        $el = $(el)
        if mouseTrapRails.keysShown
          $el.removeClass('mt-hotkey-el').find('.mt-hotkey-hint').remove()
        else
          mtKey = $el.data('keybinding')
          $hint = "<i class='mt-hotkey-hint' title='Press \<#{mtKey}\> to open link'>#{mtKey}</i>"
          $el.addClass('mt-hotkey-el') unless $el.css('position') is 'absolute'
          $el.append $hint
      @keysShown ^= true

  mouseTrapRails.toggleHints if mouseTrapRails.keysShown
  Mousetrap.bind mouseTrapRails.toggleKeys, -> mouseTrapRails.toggleHints()
