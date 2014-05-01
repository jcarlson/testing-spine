// Generated by CoffeeScript 1.7.1
(function() {
  describe('book', function() {
    beforeEach(function() {
      this.view = affix('.view');
      this.template = Handlebars.templates[this.suite.description];
      this.book = {
        title: 'Testing Spine',
        author: 'Jarrod Carlson'
      };
      return $(this.template(this.book)).appendTo(this.view);
    });
    it('should have a title', function() {
      expect(this.view.find('.title')).toExist();
      return expect(this.view.find('.title')).toHaveText('Testing Spine');
    });
    return it('should have an author', function() {
      expect(this.view.find('.author')).toExist();
      return expect(this.view.find('.author')).toHaveText('Jarrod Carlson');
    });
  });

}).call(this);