$.fn.extend
  expList: (options) ->
    self = $.fn.expList
    opts = $.extend {}, self.default_options, options
    $(this).each (i, elem) ->
      self.init elem, opts
      self.log elem if opts.log

$.extend $.fn.expList,
  default_options:
    log: true
    duration: 600

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

