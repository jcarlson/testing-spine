describe 'Library', ->
  beforeEach ->
    @controller = new Library()

  describe '#bindToEvents', ->
    beforeEach ->
      spyOn(Book, 'bind')
      @controller.bindToEvents()

    it 'should bind to "loading"', ->
      expect(Book.bind).toHaveBeenCalledWith('loading', @controller.loading)

    it 'should bind to "loading" (alt)', ->
      expect(Book).toHaveBound('loading', @controller.loading)

  describe '#checkout', ->

    # How?