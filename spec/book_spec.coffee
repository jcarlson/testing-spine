describe 'Book', ->

  describe '.checkout(isbn)', ->

    beforeEach ->
      @isbn = '1234567890'
      @ajax = new $.Deferred()
      spyOn($, 'ajax').andReturn( @ajax )

    it 'returns a thenable promise', ->
      promise = Book.checkout(@isbn)
      expect( promise.then ).toEqual( jasmine.any(Function) )

    it 'triggers a loading:start event', ->
      spy = jasmine.createSpy('loading')
      Book.on('loading', spy)
      Book.checkout(@isbn)
      expect(spy).toHaveBeenCalledWith(true, @isbn)

    it 'makes an ajax request', ->
      Book.checkout(@isbn)
      expect($.ajax).toHaveBeenCalledWith("/books/#{@isbn}")

    it 'resolves the promise with a Book', ->
      spy = jasmine.createSpy('then')
      promise = Book.checkout(@isbn)
      promise.then(spy)

      resolver = => @ajax.resolve( title: 'Testing Spine', author: 'Jarrod Carlson' )
      condition = -> spy.wasCalled

      setTimeout resolver, 100
      waitsFor condition, 'Spy should be called', 500

      runs -> expect(spy).toHaveBeenCalledWith( jasmine.any(Book) )

    it 'triggers a loading:end event', ->
      spy = jasmine.createSpy('loading')
      Book.on('loading', spy)
      Book.checkout(@isbn)

      resolver = => @ajax.resolve( title: 'Testing Spine', author: 'Jarrod Carlson' )
      condition = -> spy.callCount == 2

      setTimeout resolver, 100
      waitsFor condition, 'Spy should be called', 500

      runs -> expect(spy).toHaveBeenCalledWith( false, @isbn )
