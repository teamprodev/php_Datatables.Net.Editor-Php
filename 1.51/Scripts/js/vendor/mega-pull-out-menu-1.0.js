/*
  Mega Pull Out Menu v1.01
  (c) 2011. Web factory Ltd
  http://www.webfactoryltd.com/
  Sold exclusively on CodeCanyon
**/

(function($) {
  $.fn.pullOut = function(options) {
    // cache body DOM element
    var body_el = $('body');

    // let's try not to clutter the $.fn namespace
    var methods = {
      hide: function(event) {
        if ((event.which === 1 || event.which === 0) && $('.pull-out-opened').length) {
          $('.pull-out-opened .pull-out-button').click();
        }
      } // hide
    };

    // default options
    var defaults = {
      'position'         : 'left',
      'top'              : '45%',
      'bottom'           : false,
      'showOn'           : 'hover',
      'slideSpeed'       : 'normal',
      'scrollWithContent': false,
      'buttonPull'       : 'plus-minus',
      'buttonTitle'      : 'Hover to open/close the menu',
      'buttonSize'       : 32,
      'color'            : 'minimal',
      'maxWidth'         : 500,
      'debug'            : false
    };
    options = $.extend(defaults, options);

    // debug
    options.debug = Boolean(options.debug);
    if (options.debug && typeof console !== 'undefined') {
      console.warn('Pull Out Menu debugging is enabled.');
    }
    // position
    var tmp_position = ['left', 'right'];
    options.position = options.position.toLowerCase();
    if ($.inArray(options.position, tmp_position) === -1) {
      options.position = 'left';
    }

    // top
    if (typeof(options.top) === 'string') {
      options.top = options.top.toLowerCase();
    }
    if (options.top.substr(-2) !== 'px' && options.top.substr(-1) !== '%') {
      options.top = parseInt(options.top, 10) + 'px';
    }

    // bottom
    if (options.bottom !== false) {
      if (typeof(options.bottom) === 'string') {
        options.bottom = options.bottom.toLowerCase();
      }
      options.bottom = options.bottom.toLowerCase();
      if (options.bottom.substr(-2) !== 'px' && options.bottom.substr(-1) !== '%') {
        options.bottom = parseInt(options.bottom, 10) + 'px';
      }
    }

    // showOn action
    var tmp_showOn = ['click', 'hover'];
    options.showOn = options.showOn.toLowerCase();
    if ($.inArray(options.showOn, tmp_showOn) === -1) {
      options.showOn = 'hover';
    }

    // slideSpeed
    var tmp_slideSpeed = ['normal', 'slow', 'fast'];
    options.slideSpeed = options.slideSpeed.toLowerCase();
    if ($.inArray(options.slideSpeed, tmp_slideSpeed) === -1) {
      options.slideSpeed = parseInt(options.slideSpeed, 10);
    }

    // button
    var tmp_button = ['arrows',    'arrows2',   'arrows3',    'article', 'calendar',
                      'chat',      'contact',   'folder',     'help',    'home',
                      'links',     'mail',      'plus-minus', 'poker',   'preferences',
                      'smiley',    'social',    'tasks',      'whistle', 'graph',
                      'article-r', 'arrows2-r', 'arrows3-r',  'mail-r'];
    if ($.inArray(options.buttonPull, tmp_button) !== -1) {
      if (options.position === 'right' && $.inArray(options.buttonPull + '-r', tmp_button) !== -1) {
        options.buttonPull = '../../../../../../basin/img/pull-out/sprites/' + options.buttonPull + '-r.png';
      } else {
        options.buttonPull = '../../../../../../basin/img/pull-out/sprites/' + options.buttonPull + '.png';
      }
    }

    // scrollWithContent
    options.scrollWithContent = Boolean(options.scrollWithContent);

    // maxWidth has to be in px
    options.maxWidth = parseInt(options.maxWidth, 10);

    // buttonSize has to be in px
    options.buttonSize = parseInt(options.buttonSize, 10);

    // trim the color string
    options.color = $.trim(options.color);

    // global MPUM counter
    if(typeof body_el.data('pullOut-nb') === 'undefined') {
       body_el.data('pullOut-nb', 1);
    }

    // global MPUM zindex counter
    if(typeof body_el.data('pullOut-nb-zindex') === 'undefined') {
       body_el.data('pullOut-nb-zindex', 1);
    }

    // global MPUM body click bind
    if(typeof body_el.data('pullOut-bind-click') === 'undefined') {
       body_el.data('pullOut-bind-click', 0);
    }

    if (options.debug && typeof console !== 'undefined') {
      console.log('MPUM; options: ', options);
    }

    // we can only work with one DOM element at a time
    if (this.length > 1) {
      alert('You can apply Mega Pull Out Menu only on one HTML item at a time. Current nb of items: ' + this.length + '.');
      if (options.debug && typeof console !== 'undefined') {
        console.error('MPUM; You can apply Mega Pull Out Menu only on one HTML item at a time. Current nb of items: ', this.length + '.');
      }
      return;
    }

    // hide menu on document click
    if (options.showOn === 'click' && body_el.data('pullOut-bind-click') === 0) {
      body_el.bind('click', methods.hide);
      body_el.data('pullOut-bind-click', 1);
    }

    // process the single DOM element
    return this.each(function() {
      var org_element = $(this);

      if (options.debug && typeof console !== 'undefined') {
        console.log('MPUM; nb: ', body_el.data('pullOut-nb'));
      }

      // create & configure container
      body_el.append('<div id="pull-out-' + body_el.data('pullOut-nb') + '" class="pull-out"></div>');
      var container = $('#pull-out-' + body_el.data('pullOut-nb'))
                        .addClass('pull-out-' + options.position)
                        .addClass('pull-out-' + options.color)
                        .addClass('pull-out-closed')
                        .css(options.position, 0);
      if (options.scrollWithContent) {
        container.css('position', 'absolute');
      } else {
        container.css('position', 'fixed');
      }
      if (options.bottom !== false) {
        container.css('bottom', options.bottom);
      } else {
        container.css('top', options.top);
      }

      // prevent bubling
      if (options.showOn === 'click') {
        container.click(function(event){
          event.stopPropagation();
        });
      }

      // create & configure content
      container.append('<div class="pull-out-content"></div>');
      org_element.show();
      var content = $('.pull-out-content', container)
                      .html(org_element)
                      .css('max-width', options.maxWidth + 'px');

      // 0+ is to fix a stupid IE bug
      var width = content.outerWidth(true) + parseInt(0 + container.css('border-right-width'), 10)
                                           + parseInt(0 + container.css('border-left-width'), 10);
      content.css('width', content.width() + 'px');

      if (options.debug && typeof console !== 'undefined') {
        console.log('MPUM; content.innerWidth: ', width);
      }

      // create & configure the button
      container.append('<div class="pull-out-button"></div>');
      var buttonPull = $('.pull-out-button', container)
                     .css('top', '0')
                     .css('padding', '10px')
                     .css('cursor', 'pointer')
                     .css('position', 'absolute')
                     .attr('title', options.buttonTitle)
                     .css(options.position, width + 'px');
     buttonPull.append('<div class="pull-out-button-inner"></div>');
      var buttonInner = $('div', buttonPull)
                          .css('background', 'url(' + options.buttonPull + ') no-repeat center 0')
                          .css('width', options.buttonSize)
                          .css('height', options.buttonSize);
      // hide menu on init
      container.css(options.position, -1 * width + 'px');

      // show/hide on hover/click
      var tmp_pos = {};
      if (options.showOn === 'click') {
        buttonPull.toggle(
          function() {
            tmp_pos[options.position] = 0;
            container.stop(true, false).animate(tmp_pos, options.slideSpeed);
            buttonInner.css('background-position', 'center -' + options.buttonSize + 'px');
            container.css('z-index', 10000 + body_el.data('pullOut-nb-zindex'))
                     .addClass('pull-out-opened')
                     .removeClass('pull-out-closed');
            body_el.data('pullOut-nb-zindex', body_el.data('pullOut-nb-zindex') + 1);
          },
          function() {
            tmp_pos[options.position] = -1 * parseInt(width, 10) + 'px';
            container.stop(true, false).animate(tmp_pos, options.slideSpeed, function() {
                                          container.css('z-index', 10000)
                                                   .addClass('pull-out-closed')
                                                   .removeClass('pull-out-opened');
                                          });
            buttonInner.css('background-position', 'center 0');

          }
        );
      } else { // hover
        container.hover(
          function() {
            tmp_pos[options.position] = 0;
            container.stop(true, false).animate(tmp_pos, options.slideSpeed);
            buttonInner.css('background-position', 'center -' + options.buttonSize + 'px');
            container.css('z-index', 10000 + body_el.data('pullOut-nb-zindex'))
                     .addClass('pull-out-opened')
                     .removeClass('pull-out-closed');
          },
          function() {
            tmp_pos[options.position] = -1 * parseInt(width, 10) + 'px';
            container.stop(true, false).animate(tmp_pos, options.slideSpeed, function() {
                                          container.css('z-index', 10000)
                                                   .addClass('pull-out-closed')
                                                   .removeClass('pull-out-opened');
                                          });
            buttonInner.css('background-position', 'center 0');
          }
        );
      } // if(options.showOn)

      // increase global PU counter
      body_el.data('pullOut-nb', body_el.data('pullOut-nb') + 1);
    }); // each
  }; // fn.pullOut
} (jQuery));