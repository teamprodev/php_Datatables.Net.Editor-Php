;(function ($, window, document, undefined) {
  'use strict';

  Foundation.libs.topbar2 = {
    name : 'topbar2',

    version: '5.1.1',

    settings : {
      index : 0,
      sticky_class : 'sticky',
      custom_back_text: true,
      back_text: 'Back',
      is_hover: true,
      mobile_show_parent_link: false,
      scrolltop : true // jump to top when sticky nav menu toggle is clicked
    },

    init : function (section, method, options) {
      Foundation.inherit(this, 'add_custom_rule register_media throttle');
      var self = this;

      self.register_media('topbar2', 'foundation-mq-topbar2');

      this.bindings(method, options);

      self.S('[' + this.attr_name() + ']', this.scope).each(function () {
        var topbar2 = self.S(this),
            settings = topbar2.data(self.attr_name(true) + '-init'),
            section = self.S('section', this),
            titlebar = $('> ul', this).first();

        topbar2.data('index', 0);

        var topbar2Container = topbar2.parent();
        if(topbar2Container.hasClass('fixed') || topbar2Container.hasClass(settings.sticky_class)) {
          self.settings.sticky_class = settings.sticky_class;
          self.settings.sticky_topbar2 = topbar2;
          topbar2.data('height', topbar2Container.outerHeight());
          topbar2.data('stickyoffset', topbar2Container.offset().top);
        } else {
          topbar2.data('height', topbar2.outerHeight());
        }

        if (!settings.assembled) self.assemble(topbar2);

        if (settings.is_hover) {
          self.S('.has-dropdown', topbar2).addClass('not-click');
        } else {
          self.S('.has-dropdown', topbar2).removeClass('not-click');
        }

        // Pad body when sticky (scrolled) or fixed.
        self.add_custom_rule('.f-topbar2-fixed { padding-top: ' + topbar2.data('height') + 'px }');

        if (topbar2Container.hasClass('fixed')) {
          self.S('body').addClass('f-topbar2-fixed');
        }
      });

    },

    toggle: function (toggleEl) {
      var self = this;

      if (toggleEl) {
        var topbar2 = self.S(toggleEl).closest('[' + this.attr_name() + ']');
      } else {
        var topbar2 = self.S('[' + this.attr_name() + ']');
      }

      var settings = topbar2.data(this.attr_name(true) + '-init');

      var section = self.S('section, .section', topbar2);

      if (self.breakpoint()) {
        if (!self.rtl) {
          section.css({left: '0%'});
          $('>.name', section).css({left: '100%'});
        } else {
          section.css({right: '0%'});
          $('>.name', section).css({right: '100%'});
        }

        self.S('li.moved', section).removeClass('moved');
        topbar2.data('index', 0);

        topbar2
          .toggleClass('expanded')
          .css('height', '');
      }

      if (settings.scrolltop) {
        if (!topbar2.hasClass('expanded')) {
          if (topbar2.hasClass('fixed')) {
            topbar2.parent().addClass('fixed');
            topbar2.removeClass('fixed');
            self.S('body').addClass('f-topbar2-fixed');
          }
        } else if (topbar2.parent().hasClass('fixed')) {
          if (settings.scrolltop) {
            topbar2.parent().removeClass('fixed');
            topbar2.addClass('fixed');
            self.S('body').removeClass('f-topbar2-fixed');

            window.scrollTo(0,0);
          } else {
              topbar2.parent().removeClass('expanded');
          }
        }
      } else {
        if(topbar2.parent().hasClass(self.settings.sticky_class)) {
          topbar2.parent().addClass('fixed');
        }

        if(topbar2.parent().hasClass('fixed')) {
          if (!topbar2.hasClass('expanded')) {
            topbar2.removeClass('fixed');
            topbar2.parent().removeClass('expanded');
            self.update_sticky_positioning();
          } else {
            topbar2.addClass('fixed');
            topbar2.parent().addClass('expanded');
            self.S('body').addClass('f-topbar2-fixed');
          }
        }
      }
    },

    timer : null,

    events : function (bar) {
      var self = this,
          S = this.S;

      S(this.scope)
        .off('.topbar2')
        .on('click.fndtn.topbar2', '[' + this.attr_name() + '] .toggle-topbar2', function (e) {
          e.preventDefault();
          self.toggle(this);
        })
        .on('click.fndtn.topbar2', '[' + this.attr_name() + '] li.has-dropdown', function (e) {
          var li = S(this),
              target = S(e.target),
              topbar2 = li.closest('[' + self.attr_name() + ']'),
              settings = topbar2.data(self.attr_name(true) + '-init');

          if(target.data('revealId')) {
            self.toggle();
            return;
          }

          if (self.breakpoint()) return;
          if (settings.is_hover && !Modernizr.touch) return;

          e.stopImmediatePropagation();

          if (li.hasClass('hover')) {
            li
              .removeClass('hover')
              .find('li')
              .removeClass('hover');

            li.parents('li.hover')
              .removeClass('hover');
          } else {
            li.addClass('hover');

            if (target[0].nodeName === 'A' && target.parent().hasClass('has-dropdown')) {
              e.preventDefault();
            }
          }
        })
        .on('click.fndtn.topbar2', '[' + this.attr_name() + '] .has-dropdown>a', function (e) {
          if (self.breakpoint()) {

            e.preventDefault();

            var $this = S(this),
                topbar2 = $this.closest('[' + self.attr_name() + ']'),
                section = topbar2.find('section, .section'),
                dropdownHeight = $this.next('.dropdown').outerHeight(),
                $selectedLi = $this.closest('li');

            topbar2.data('index', topbar2.data('index') + 1);
            $selectedLi.addClass('moved');

            if (!self.rtl) {
              section.css({left: -(100 * topbar2.data('index')) + '%'});
              section.find('>.name').css({left: 100 * topbar2.data('index') + '%'});
            } else {
              section.css({right: -(100 * topbar2.data('index')) + '%'});
              section.find('>.name').css({right: 100 * topbar2.data('index') + '%'});
            }

            topbar2.css('height', $this.siblings('ul').outerHeight(true) + topbar2.data('height'));
          }
        });
      
      S(window).off('.topbar2').on('resize.fndtn.topbar2', self.throttle(function () {
        self.resize.call(self);
      }, 50)).trigger('resize');

      S('body').off('.topbar2').on('click.fndtn.topbar2 touchstart.fndtn.topbar2', function (e) {
        var parent = S(e.target).closest('li').closest('li.hover');

        if (parent.length > 0) {
          return;
        }

        S('[' + self.attr_name() + '] li').removeClass('hover');
      });

      // Go up a level on Click
      S(this.scope).on('click.fndtn.topbar2', '[' + this.attr_name() + '] .has-dropdown .back', function (e) {
        e.preventDefault();

        var $this = S(this),
            topbar2 = $this.closest('[' + self.attr_name() + ']'),
            section = topbar2.find('section, .section'),
            settings = topbar2.data(self.attr_name(true) + '-init'),
            $movedLi = $this.closest('li.moved'),
            $previousLevelUl = $movedLi.parent();

        topbar2.data('index', topbar2.data('index') - 1);

        if (!self.rtl) {
          section.css({left: -(100 * topbar2.data('index')) + '%'});
          section.find('>.name').css({left: 100 * topbar2.data('index') + '%'});
        } else {
          section.css({right: -(100 * topbar2.data('index')) + '%'});
          section.find('>.name').css({right: 100 * topbar2.data('index') + '%'});
        }

        if (topbar2.data('index') === 0) {
          topbar2.css('height', '');
        } else {
          topbar2.css('height', $previousLevelUl.outerHeight(true) + topbar2.data('height'));
        }

        setTimeout(function () {
          $movedLi.removeClass('moved');
        }, 300);
      });
    },

    resize : function () {
      var self = this;
      self.S('[' + this.attr_name() + ']').each(function () {
        var topbar2 = self.S(this),
            settings = topbar2.data(self.attr_name(true) + '-init');

        var stickyContainer = topbar2.parent('.' + self.settings.sticky_class);
        var stickyOffset;

        if (!self.breakpoint()) {
          var doToggle = topbar2.hasClass('expanded');
          topbar2
            .css('height', '')
            .removeClass('expanded')
            .find('li')
            .removeClass('hover');

            if(doToggle) {
              self.toggle(topbar2);
            }
        }

        if(stickyContainer.length > 0) {
          if(stickyContainer.hasClass('fixed')) {
            // Remove the fixed to allow for correct calculation of the offset.
            stickyContainer.removeClass('fixed');

            stickyOffset = stickyContainer.offset().top;
            if(self.S(document.body).hasClass('f-topbar2-fixed')) {
              stickyOffset -= topbar2.data('height');
            }

            topbar2.data('stickyoffset', stickyOffset);
            stickyContainer.addClass('fixed');
          } else {
            stickyOffset = stickyContainer.offset().top;
            topbar2.data('stickyoffset', stickyOffset);
          }
        }

      });
    },

    breakpoint : function () {
      return !matchMedia(Foundation.media_queries['topbar2']).matches;
    },

    assemble : function (topbar2) {
      var self = this,
          settings = topbar2.data(this.attr_name(true) + '-init'),
          section = self.S('section', topbar2),
          titlebar = $('> ul', topbar2).first();

      // Pull element out of the DOM for manipulation
      section.detach();

      self.S('.has-dropdown>a', section).each(function () {
        var $link = self.S(this),
            $dropdown = $link.siblings('.dropdown'),
            url = $link.attr('href');

        if (!$dropdown.find('.title.back').length) {
          if (settings.mobile_show_parent_link && url && url.length > 1) {
            var $titleLi = $('<li class="title back js-generated"><h5><a href="javascript:void(0)"></a></h5></li><li><a class="parent-link js-generated" href="' + url + '">' + $link.text() +'</a></li>');
          } else {
            var $titleLi = $('<li class="title back js-generated"><h5><a href="javascript:void(0)"></a></h5></li>');
          }
  
          // Copy link to subnav
          if (settings.custom_back_text == true) {
            $('h5>a', $titleLi).html(settings.back_text);
          } else {
            $('h5>a', $titleLi).html('&laquo; ' + $link.html());
          }
          $dropdown.prepend($titleLi);
        }
      });

      // Put element back in the DOM
      section.appendTo(topbar2);

      // check for sticky
      this.sticky();

      this.assembled(topbar2);
    },

    assembled : function (topbar2) {
      topbar2.data(this.attr_name(true), $.extend({}, topbar2.data(this.attr_name(true)), {assembled: true}));
    },

    height : function (ul) {
      var total = 0,
          self = this;

      $('> li', ul).each(function () { total += self.S(this).outerHeight(true); });

      return total;
    },

    sticky : function () {
      var $window = this.S(window),
          self = this;

      this.S(window).on('scroll', function() {
        self.update_sticky_positioning();
      });
    },

    update_sticky_positioning: function() {
      var klass = '.' + this.settings.sticky_class,
          $window = this.S(window),
          self = this;


      if (self.S(klass).length > 0) {
        var distance = this.settings.sticky_topbar2.data('stickyoffset');
        if (!self.S(klass).hasClass('expanded')) {
          if ($window.scrollTop() > (distance)) {
            if (!self.S(klass).hasClass('fixed')) {
              self.S(klass).addClass('fixed');
              self.S('body').addClass('f-topbar2-fixed');
            }
          } else if ($window.scrollTop() <= distance) {
            if (self.S(klass).hasClass('fixed')) {
              self.S(klass).removeClass('fixed');
              self.S('body').removeClass('f-topbar2-fixed');
            }
          }
        }
      }
    },

    off : function () {
      this.S(this.scope).off('.fndtn.topbar2');
      this.S(window).off('.fndtn.topbar2');
    },

    reflow : function () {}
  };
}(jQuery, this, this.document));
