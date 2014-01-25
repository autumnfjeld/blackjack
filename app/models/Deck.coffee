class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(0, 52)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  #hand is an array with two cards off the top of 'this/@' which is the deck (the current)
  #
  dealPlayer: -> hand = new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
