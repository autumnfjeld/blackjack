class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'
    #template: _.template '<h2><% if(suitName == 'Hearts'){ %>class="red"<% }%> <span class="score"></span>/h2>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
