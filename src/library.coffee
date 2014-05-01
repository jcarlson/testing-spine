class Library extends Spine.Controller

  events:
    'click [data-action="checkout"]': 'checkout'

  constructor: ->
    super
    @bindToEvents()

  bindToEvents: ->
    Book.bind('loading', @loading)

  checkout: (e) ->
    e.preventDefault()
    isbn = $(e.target).data('isbn')
    promise = Book.checkout(isbn)
    promise.then @renderBook

  loading: (isLoading, isbn) ->
    $('#loading').toggle(isLoading)

  renderBook: (book) =>
    @html Handlebars.templates['book'](book)

window.Library = Library