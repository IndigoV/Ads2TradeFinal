//(function() {
    var RfpCampaigns;

    RfpCampaigns = {
        j: jQuery,
        bootstrapModal: function(options) {
            var a, b, body, buttons, closeBtn, footer, header, headerTitle, main, second, sp, third, _i, _len;
            if (options == null) {
                options = {};
            }
            this.j('#' + options.id).remove();
            main = this.j('<div/>');
            main.attr('id', options.id);
            main.addClass('modal');
            second = this.j('<div/>');
            second.addClass('modal-dialog');
            second.css('width', '85%;');
            third = this.j('<div/>');
            third.addClass('modal-content');
            header = this.j('<div/>');
            header.addClass('modal-header');
            closeBtn = this.j('<button/>');
            closeBtn.attr('type', 'button');
            closeBtn.attr('data-dismiss', 'modal');
            closeBtn.attr('aria-hidden', 'true');
            closeBtn.addClass('close');
            closeBtn.html('x');
            header.append(closeBtn);
            headerTitle = this.j('<h4/>');
            headerTitle.addClass('modal-title');
            headerTitle.html(options.title);
            header.append(headerTitle);
            third.append(header);
            body = this.j('<div/>');
            body.addClass('modal-body');
            body.html(options.html);
            third.append(body);
            footer = this.j('<div/>');
            footer.addClass('modal-footer');
            footer.css('border-top', '0px');
            if (typeof options.buttons !== 'undefined') {
                buttons = options.buttons;
                for (b = _i = 0, _len = buttons.length; _i < _len; b = ++_i) {
                    b = buttons[b];
                    sp = this.j('<span/>');
                    sp.css('padding', '4px');
                    a = this.j('<a/>');
                    a.attr('href', '#');
                    a.addClass('btn-sm btn-primary');
                    a.css('color', '#fff');
                    a.css('padding', '5px');
                    a.html(b.caption);
                    a.attr('onclick', b.onclick);
                    sp.append(a);
                    footer.append(sp);
                }
            }
            third.append(footer);
            second.append(third);
            main.append(second);
            main.appendTo('body');
            this.j('#' + options.id).on('hidden.bs.modal', (function(_this) {
                return function() {
                    return _this.j('#' + options.id).remove();
                };
            })(this));
            return this.j('#' + options.id).modal({
                show: true
            });
        },
        sendBackToMediaOwner: function(id) {
            return this.j.get('send_back_to_media_owner', {
                id: id
            }, (function(_this) {
                return function(data) {
                    return _this.bootstrapModal({
                        id: 'win-send-back-media-owner',
                        title: 'Send back to media owner',
                        html: data
                    });
                };
            })(this));
        },
        doSendBackToMediaOwner: function() {
            if (this.j('#comment').val().toString().trim() === '') {
                return alert('Enter a comment please');
            } else {
                return this.j.post('do_send_back_to_media_owner', {
                    comment: this.j('#comment').val(),
                    id: this.j('#id').val()
                }, (function(_this) {
                    return function(data) {
                        data = _this.j.parseJSON(data);
                        if (data.success === true) {
                            _this.j('#win-send-back-media-owner').modal('hide');
                            return window.location.href = 'proposals';
                        } else {
                            return alert(data.message);
                        }
                    };
                })(this));
            }
        },
        viewCampaignQuotations: function(campaignId) {
            return this.j.get('view_campaign_quotations', {
                id: campaignId
            }, (function(_this) {
                return function(data) {
                    return _this.j('#campaign_quotations_area').html(data);
                };
            })(this));
        }
    };

//}).call(this);
