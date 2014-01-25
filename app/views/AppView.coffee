class window.AppView extends Backbone.View

  template: _.template '
    <div class="controls">
      <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    </div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  template2: _.template '
    <button class="play-again">Play Again</button>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: -> 
    @render()
    @model.get('playerHand').on 'bust', @renderBust, @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new PlayerView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderBust: ->
    console.log(@$('.controls'))
    @$('.controls').replaceWith @template2()



    # two hands are shown, player and dealer. they are created with collections of
    # "this model = @model"  @model refers to App model
    # BUT where is the link between AppView and @model made? in main.coffee
    #'playe'