sticky_menu = ->
  if $(this).scrollTop() > 93
    $('#header, #menu').addClass 'fixed'
  else
    $('#header, #menu').removeClass 'fixed'

check_person = ->
  person = $('.order-main-form .person .buttons input:checked').val()
  console.log(person)

  $('.field input').hide();

  if person == 'individual'
    $('.field input.individual').show()
  else
    $('.field input').show()


$ ->

  $('.open-popup-link').magnificPopup
    type: 'inline'
    midClick: true
    removalDelay: 500
    callbacks:
      beforeOpen: ->
        this.st.mainClass = this.st.el.attr('data-effect')

  sticky_menu()
  $(window).scroll ->
    sticky_menu()

  $(document).on 'click', '.amount.can-change a', (e)->
    e.preventDefault()
    $input = $(@).parent().find('input')
    val = parseInt($(@).data('value'))
    new_val = parseInt($input.val()) + val
    $input.val(new_val)
    $input.trigger('change')

  $(document).on 'change', '.amount.can-change input', ->
    val = parseInt($(@).val()) || 1
    val = 1 if val < 1
    $(@).val(val)

  $(document).on 'click', '.catalog-list .sort .by span', ->
    if $(@).next().is(':visible')
      $(@).next().fadeOut(100)
    else
      $(@).next().fadeIn(100)

  $('select.styler, input[type="radio"].styler, input[type="file"].styler').styler()

  $(document).on 'click', '.product-detail .detail-information .tabs .tab a', (e)->
    e.preventDefault()
    $('.product-detail .detail-information .content-tab').hide()
    $('.product-detail .detail-information .tabs .tab a').removeClass('active')
    $($(@).attr('href')).show()
    $(@).addClass('active')

  $('.product-detail .slider-column .carousel').carouFredSel
    width: 480
    height: 330
    items:
      width: 480
      height: 330
      visible: 1
    scroll:
      fx: 'crossfade'
      items: 1
      duration: 300
      timeoutDuration: 3000
      pauseOnHover: true
    auto: false

  $(document).on 'click', '.product-detail .slider-column .thumbs-wrapper a', (e)->
    e.preventDefault()
    $('.product-detail .slider-column .carousel').trigger 'slideTo', $(@).attr('href')
    $('.product-detail .slider-column .thumbs-wrapper a').removeClass 'selected'
    $(@).addClass 'selected'

  $('.news-products-slider .carousel').carouFredSel
    width: 320
    height: 188
    items:
      width: 320
      height: 188
      visible: 1
    scroll:
      items: 1
      duration: 300
      timeoutDuration: 3000
      pauseOnHover: true
    auto: true
    pagination:
      container: '.news-products-slider .bullets'

  $('.big-slider .carousel').carouFredSel
    width: 960
    height: 639
    items:
      width: 960
      height: 639
      visible: 1
    scroll:
      items: 1
      duration: 300
      timeoutDuration: 3000
      pauseOnHover: true
    auto: true
    prev: '.big-slider .arrow.prev'
    next: '.big-slider .arrow.next'

  $('.main-block .left-column .slider .carousel').carouFredSel
    width: 551
    height: 79
    items:
      width: 141
      height: 79
      visible: 4
    scroll:
      items: 1
      duration: 300
      timeoutDuration: 3000
      pauseOnHover: true
    auto: true
    prev: '.main-block .left-column .slider .arrow.prev'
    next: '.main-block .left-column .slider .arrow.next'

  $('.promotion-carousel .carousel').carouFredSel
    width: 960
    height: 610
    items:
      width: 960
      height: 610
      visible: 1
    scroll:
#      fx: 'crossfade'
      items: 1
      duration: 300
      timeoutDuration: 3000
      pauseOnHover: true
      onAfter: (data)->
        $(@).trigger 'currentPosition', (pos)->
          $('.promotion-carousel .promotions-preview a').removeClass 'selected'
          $(".promotion-carousel .promotions-preview a[href=\"#promotion-#{pos}\"]").addClass 'selected'
    auto: false
    prev: '.promotion-carousel .arrow.prev'
    next: '.promotion-carousel .arrow.next'

  $(document).on 'click', '.promotion-carousel .promotions-preview a', (e)->
    e.preventDefault()
    $('.promotion-carousel .carousel').trigger 'slideTo', $(@).attr('href')
    $('.promotion-carousel .promotions-preview a').removeClass 'selected'
    $(@).addClass 'selected'

  $(document).on 'click', '.catalog-list .header .view a', (e)->
    e.preventDefault()
    $.cookie('catalog_view', $(@).data('view'))
    location.reload()

  $(document).on 'click', '#footer .item.show-shops-map', ->
    if $('.shops-map').hasClass('visible')
      $('.title', this).text('Показать')
      $('.shops-map').stop().removeClass('visible').animate({bottom: -540})
    else
      $('.shops-map').stop().addClass('visible').animate({bottom: 0})
      $('.title', this).text('Скрыть')

  $(document).on 'click', '.shops-map .close img', ->
    $('#footer .item.show-shops-map .title').text('Показать')
    $('.shops-map').stop().removeClass('visible').animate({bottom: -540})

  $(document).on 'click', '.column-marks .block-type:not(.no-children) .header a.show-more, .column-marks .block-type:not(.block-price-categories) .header', (e)->
    e.preventDefault()

    $block = $(@).closest('.block-type')
    $block_wrapper = $(@).closest('.block-column-wrapper')

    if $block.hasClass('active')
      $block.removeClass('active')
      $block.find('.marks-list').slideUp(300)
    else
#      $('.block-type.active', $block_wrapper).find('.marks-list').slideUp(0)
#      $('.block-type', $block_wrapper).removeClass('active')
      $block.addClass('active').find('.marks-list').slideDown(300)
      $('html, body').animate({scrollTop: $block.offset().top - 70}, 300)

  $(document).on 'click', '.model-content .block-category .header', ->
    $block = $(@).closest('.block-category')

    if $block.hasClass('active')
      $block.removeClass('active')
      $block.find('.categories-list').slideUp(300)
    else
      $block.addClass('active').find('.categories-list').slideDown(300)
      
  $(document).on 'mouseenter', '.model-left-column .categories-list ul li a', ->
    offset = $(@).parent().offset().top - $('.model-left-column').offset().top - 95
    $(".model-right-column .drawing a[data-model=\"#{$(@).data('model')}\"][data-group=\"#{$(@).data('group')}\"]").parent().addClass('hover').css({marginTop: offset})

  $(document).on 'mouseleave', '.model-left-column .categories-list ul li a', ->
    $('.model-right-column .drawing a').parent().removeClass('hover')

  $(document).on 'mouseenter', '.model-right-column .drawing a', ->
    $(".model-left-column .categories-list ul li a[data-model=\"#{$(@).data('model')}\"][data-group=\"#{$(@).data('group')}\"]").addClass('hover')

  $(document).on 'mouseleave', '.model-right-column .drawing a', ->
    $('.model-left-column .categories-list ul li a').removeClass('hover')

  $(document).on 'click', '.partpicture-image .part', ->
    id = $(@).data('id')

    $('.partpicture-image .part').removeClass('active')
    $(@).addClass('active')

    $('table.standard.partpictures tr').removeClass('active')
    $part = $("table.standard.partpictures tr#partpicture_#{id}")
    $part.addClass('active')
    $('html, body').animate({scrollTop: $($part).offset().top - 70}, 300)

  $(document).on 'click', 'table.standard.partpictures tr a.check-image', (e)->
    e.preventDefault()

    $tr = $(@).closest('tr')

    id = $tr.attr('id').split('_')[1]

    $('.partpicture-image .part').removeClass('active')
    $(".partpicture-image .part[data-id=\"#{id}\"]").addClass('active')

    $('table.standard.partpictures tr').removeClass('active')
    $tr.addClass('active')
    $('html, body').animate({scrollTop: $(".partpicture-image .part[data-id=\"#{id}\"]").offset().top - 80}, 300)

  $(document).on 'change', '.catalog-search-form .select-box[data-where="catalog"] .select.car select', ->
    $.post($(@).data('path'), mark: $(@).val())

  $(document).on 'change', '.catalog-search-form .select-box[data-where="catalog"] .select.category select', ->
    $.post($(@).data('path'), model: $(@).val())

  $(document).on 'change', '.catalog-search-form .select-box[data-where="price"] .select.car select', ->
    $.post($(@).data('path'), category: $(@).val())

  $(document).on 'change', '.catalog-search-form .select-box[data-where="price"] .select.category select', ->
    $.post($(@).data('path'), subcategory: $(@).val())

  $(document).on 'ajax:beforeSend', '.payment-column .to-cart a', (e, xhr, settings)->
    if $(@).attr('data-product-id')
      settings.url += "?amount=#{$('.payment-column .amount input').val()}&product_id=#{$(@).data('product-id')}"
    else
      settings.url += "?amount=#{$('.payment-column .amount input').val()}&id=#{$(@).data('id')}&model=#{$(@).data('model')}&grouptree=#{$(@).data('grouptree')}"

  $(document).on 'change', '.cart .item .column.amount input', ->
    $.post($(@).data('url'), v: $(@).val())

  $(document).on 'ajax:beforeSend', '.to-cart-form-catalog-list a', (e, xhr, settings)->

    if $(@).closest('tr').length
      if $(@).attr('data-product-id')
        settings.url += "?amount=#{$(@).closest('tr').find('.amount.can-change input').val()}&product_id=#{$(@).data('product-id')}&list=1"
      else
        settings.url += "?amount=#{$(@).closest('tr').find('.amount.can-change input').val()}&id=#{$(@).data('id')}&model=#{$(@).data('model')}&grouptree=#{$(@).data('grouptree')}&list=1"
    else
      settings.url += "?id=#{$(@).data('id')}&model=#{$(@).data('model')}&grouptree=#{$(@).data('grouptree')}&list=2"

  $(document).on 'mouseenter', '.models-list .model .name a', ->
    $(@).closest('.model').find('.image').addClass('hover')

  $(document).on 'mouseleave', '.models-list .model .name a', ->
    $(@).closest('.model').find('.image').removeClass('hover')

  $(document).on 'mouseenter', '.catalog-type-auto .marks-list .mark .name a', ->
    $(@).closest('.mark').find('.logo').addClass('hover')

  $(document).on 'mouseleave', '.catalog-type-auto .marks-list .mark .name a', ->
    $(@).closest('.mark').find('.logo').removeClass('hover')

  $(document).on 'click', '.catalog-type-auto .marks-list .more-marks a', (e)->
    e.preventDefault()
    if $(@).hasClass('active')
      $(@).removeClass('active').find('span').text('Показать все марки').closest('.more-marks').prev().slideUp()
    else
      $(@).addClass('active').find('span').text('Скрыть марки').closest('.more-marks').prev().slideDown()

  $(document).on 'click', '.column-marks .marks-list .more-marks a', (e)->
    e.preventDefault()
    if $(@).hasClass('active')
      $(@).removeClass('active').find('span').text('Показать все марки').closest('.more-marks').prev().slideUp()
    else
      $(@).addClass('active').find('span').text('Скрыть марки').closest('.more-marks').prev().slideDown()

  $(document).on 'click', '.pagination span.page a', (e)->
    e.stopPropagation()

  $(document).on 'click', '.pagination span.page:not(.gap)', ->
    document.location.href = $(@).find('a').attr('href')

  check_person()
  $(document).on 'click', '.order-main-form .person a', (e)->
    e.preventDefault()
    $('.order-main-form .person a').removeClass('active')
    $(@).addClass('active')
    $('.order-main-form .person .buttons input').eq($(@).index()).prop('checked', true)
    check_person()

  $(document).on 'change', '.catalog-form .buttons input', ->
    $('.catalog-form .selects .select-box').hide()
    $(".catalog-form .selects .select-box[data-where=#{$(@).val()}]").show()

  $('.editor-text.main-scrollable').mCustomScrollbar()







