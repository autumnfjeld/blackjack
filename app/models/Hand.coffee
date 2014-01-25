class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> @add(@deck.pop()).last()

    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    # Notes:
    # @reduce refers to the hand collection
    # false is the starting memo
    # hasAce will be true or false
    # score - if card is facing up/revealed then get the value
    # coffeescript: last line is what is returned
  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    hidden = @reduce (hidden, card) ->
      hidden + if not card.get 'revealed' then card.get 'value' else 0
    , 0
    console.log('hiddencard', hidden)
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    @bust() if score > 21   #will need to handle ace
    if hasAce then [score, score + 10, hidden] else [score, hidden]



  #send out bust signal, call bust from above to send out signal
  bust: ->
    @trigger 'bust'

  clear: ->
    console.log('before clear', @length)
    @reset()
    console.log('after clear', @length)

  stand: ->
    @trigger 'stand'
    console.log('triggered STAND')
