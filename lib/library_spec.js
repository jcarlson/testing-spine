// Generated by CoffeeScript 1.7.1
(function() {
  describe('Library', function() {
    beforeEach(function() {
      return this.controller = new Library();
    });
    describe('#bindToEvents', function() {
      beforeEach(function() {
        spyOn(Book, 'bind');
        return this.controller.bindToEvents();
      });
      it('should bind to "loading"', function() {
        return expect(Book.bind).toHaveBeenCalledWith('loading', this.controller.loading);
      });
      return it('should bind to "loading" (alt)', function() {
        return expect(Book).toHaveBound('loading', this.controller.loading);
      });
    });
    return describe('#checkout', function() {});
  });

}).call(this);
