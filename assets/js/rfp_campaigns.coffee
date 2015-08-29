RfpCampaigns =
  j: jQuery
  bootstrapModal:(options = {})->
    @j('#' + options.id).remove()
    main = @j('<div/>')
    main.attr('id', options.id)
    main.addClass('modal')
    second = @j('<div/>')
    second.addClass('modal-dialog')
    second.css('width', '85%;')
    third = @j('<div/>')
    third.addClass('modal-content')
    header = @j('<div/>')
    header.addClass('modal-header')
    closeBtn = @j('<button/>')
    closeBtn.attr('type', 'button')
    closeBtn.attr('data-dismiss', 'modal')
    closeBtn.attr('aria-hidden', 'true')
    closeBtn.addClass('close')
    closeBtn.html('x')
    header.append(closeBtn)
    headerTitle = @j('<h4/>')
    headerTitle.addClass('modal-title')
    headerTitle.html(options.title)
    header.append(headerTitle)
    third.append(header)
    body = @j('<div/>')
    body.addClass('modal-body')
    body.html(options.html)
    third.append(body)
    footer = @j('<div/>')
    footer.addClass('modal-footer')
    footer.css('border-top', '0px')
    if typeof(options.buttons) != 'undefined'
      buttons = options.buttons
      for b, b in buttons
        sp = @j('<span/>')
        sp.css('padding', '4px')
        a = @j('<a/>')
        a.attr('href', '#')
        a.addClass('btn-sm btn-primary')
        a.css('color', '#fff')
        a.css('padding', '5px')
        a.html(b.caption)
        a.attr('onclick', b.onclick)
        sp.append(a)
        footer.append(sp)
    third.append(footer)
    second.append(third)
    main.append(second)
    main.appendTo('body')
    @j('#' + options.id).on(
      'hidden.bs.modal',
    ()=>
      @j('#' + options.id).remove()
    )
    @j('#' + options.id).modal({show: true})
  sendBackToMediaOwner:(id)->
    @j.get(
      'send_back_to_media_owner',
      {id: id},
      (data)=>
        @bootstrapModal(
          id: 'win-send-back-media-owner',
          title: 'Send back to media owner',
          html: data
        )
    )
  doSendBackToMediaOwner:()->
    if @j('#comment').val().toString().trim() == ''
      alert('Enter a comment please')
    else
      @j.post(
        'do_send_back_to_media_owner',
        {comment: @j('#comment').val(), id: @j('#id').val()},
        (data)=>
          data = @j.parseJSON(data)
          if data.success == true
            @j('#win-send-back-media-owner').modal('hide')
            window.location.href = 'proposals'
          else
            alert(data.message)
    )
  viewCampaignQuotations:(campaignId)->
    @j.get(
      'view_campaign_quotations',
      {id: campaignId},
      (data)=>
        @j('#campaign_quotations_area').html(data)
    )