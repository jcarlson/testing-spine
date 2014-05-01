class Book extends Spine.Module
  @extend Spine.Events

  @checkout: (isbn) ->
    @trigger 'loading', true, isbn
    $.ajax("/books/#{isbn}")
      .then( (data) ->
        Book.trigger 'loading', false, isbn
        new Book(data)
      ).promise()

  constructor: (data) ->
    @[key] = value for key, value of data

window.Book = Book
