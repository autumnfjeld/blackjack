class window.PlayerView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> <span class="score"></span></h2>'
  template2: _.template '<span class="bust">BUST!!!!</span></h2>'
  # template3: _.template('<img src="<%= uri %>" class="<%= state %>" />')

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @renderBust()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    

  renderBust: ->
    #@$el.children().detach()
    #@$el.html @template @collection
    @$el.append @template2
    #@$('.bust').text 'BUST!!!!'


    #collection refers to the collection set up in AppView
