// Generated by CoffeeScript 1.7.1
(function() {
  var Library,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Library = (function(_super) {
    __extends(Library, _super);

    Library.prototype.events = {
      'click [data-action="checkout"]': 'checkout'
    };

    function Library() {
      this.renderBook = __bind(this.renderBook, this);
      Library.__super__.constructor.apply(this, arguments);
      this.bindToEvents();
    }

    Library.prototype.bindToEvents = function() {
      return Book.bind('loading', this.loading);
    };

    Library.prototype.checkout = function(e) {
      var isbn, promise;
      e.preventDefault();
      isbn = $(e.target).data('isbn');
      promise = Book.checkout(isbn);
      return promise.then(this.renderBook);
    };

    Library.prototype.loading = function(isLoading, isbn) {
      return $('#loading').toggle(isLoading);
    };

    Library.prototype.renderBook = function(book) {
      return this.html(Handlebars.templates['book'](book));
    };

    return Library;

  })(Spine.Controller);

  window.Library = Library;

}).call(this);