coffee = ES3_5 = ES6 = null

module.exports =
class CoffeeProvider
  fromScopeName: 'source.coffee'
  toScopeName: 'source.js'

  transform: (code, {sourceMap} = {}) ->
    ES3_5 ?= require 'coffee-script'
    ES6 ?= require 'coffeescript'

    coffee = switch atom.config.get('source-preview.builtinProviderTarget')
      when 'ES3–5' then ES3_5
      when 'ES6+' then ES6
      else false

    options =
      sourceMap: sourceMap ? false
      bare: atom.config.get('source-preview.coffeeProviderOptionBare')

    result = coffee.compile(code, options)
    result = {js: result} unless options.sourceMap

    {
      code: result.js
      sourceMap: result.v3SourceMap ? null
    }
