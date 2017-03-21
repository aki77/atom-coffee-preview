{CompositeDisposable, Disposable} = require 'atom'
CoffeeProvider = null

module.exports =
class ProviderManager
  providers: null
  subscriptions: null

  constructor: ->
    @subscriptions = new CompositeDisposable
    @providers = []
    @subscriptions.add(atom.config.observe('source-preview.builtinProviderTarget', @toggleBuiltinProvider))

  dispose: ->
    @subscriptions?.dispose()
    @subscriptions = null
    @providers = null

  toggleBuiltinProvider: (target) =>
    return unless target?

    if target is 'Disable'
      @builtinProviderRegistration?.dispose()
      @builtinProvider?.dispose?()
      @builtinProviderRegistration = null
      @builtinProvider = null
    else
      return if @builtinProvider? or @builtinProviderRegistration?
      CoffeeProvider ?= require('./coffee-provider')
      @builtinProvider = new CoffeeProvider
      @builtinProviderRegistration = @registerProvider(@builtinProvider)

  providerForGrammar: ({name, scopeName}) ->
    for provider in @providers
      return provider if provider.fromGrammarName is name

    for provider in @providers
      return provider if provider.fromScopeName is scopeName

    null

  isProviderRegistered: (provider) ->
    provider in @providers

  addProvider: (provider) =>
    return if @isProviderRegistered(provider)
    @providers.push(provider)
    @subscriptions.add(provider) if provider.dispose?

  removeProvider: (provider) =>
    return unless @providers
    @providers.splice(@providers.indexOf(provider), 1)
    @subscriptions?.remove(provider) if provider.dispose?

  registerProvider: (provider) ->
    return unless provider?
    return if @isProviderRegistered(provider)

    @addProvider(provider)
    disposable = new Disposable =>
      @removeProvider(provider)
