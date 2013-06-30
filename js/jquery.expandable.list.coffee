$.fn.extend
  expList: (options) ->
    self = $.fn.expList
    opts = $.extend {}, self.default_options, options
    $(this).each (i, elem) ->
      self.init elem, opts

$.extend $.fn.expList,
  default_options:
    duration: 600
    enableLinks: true

  init: (elem, opts) ->
    $(elem).find('ul').hide()

    #hide all the sublists
    childrenList = $(elem).find('li:has(ul)')
    for child in childrenList
      do ->
        #bind elements to click button
        $(child).click( (e) ->
          $(e.target).closest('li').children('ul').toggle(opts.duration)
          e.stopPropagation();
        )

    #enable links inside the list unbinding the event and stopping the even bubbling
    if opts.enableLinks
      $(elem).find('a').off('click')
      .on('click', (e) ->
        e.stopPropagation()
      )
