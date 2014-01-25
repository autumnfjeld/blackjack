#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'bust', @newDeal, @
    #@get('playerHand').on 'bust', console.log('check', @get('deck'))@   #if event bust happens do stuff

  newDeal: ->
    @initialize()
    # console.log('test', @get('playerHand'))
    # #, @get('playerhand').scores())
    # @get('playerHand').clear()
    # @set @get('playerHand'), @get('deck').dealPlayer()
    # console.log('again', @get('playerHand'))
