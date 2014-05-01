describe 'book', ->

  beforeEach ->
    @view = affix('.view')
    @template = Handlebars.templates[@suite.description]
    @book =
      title: 'Testing Spine'
      author: 'Jarrod Carlson'
    $( @template(@book) ).appendTo(@view)

  it 'should have a title', ->
    expect( @view.find('.title') ).toExist()
    expect( @view.find('.title') ).toHaveText('Testing Spine')

  it 'should have an author', ->
    expect( @view.find('.author') ).toExist()
    expect( @view.find('.author') ).toHaveText('Jarrod Carlson')
