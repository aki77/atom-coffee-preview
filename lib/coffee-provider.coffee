coffee = CSON = null

module.exports =
class CoffeeProvider
  fromScopeName: 'source.coffee'
  indent: 2

  transform: (code, {sourceMap} = {}) ->
    if atom.workspace.getActiveTextEditor().getTitle().endsWith('.cson')
      {parse} = CSON ?= require 'cson-parser'

      {
        code: JSON.stringify(parse(code), null, @indent)
        toScopeName: 'source.json'
      }
    else
      coffee ?= require 'coffee-script'

      options =
        sourceMap: sourceMap ? false
        bare: atom.config.get('source-preview.coffeeProviderOptionBare')

      result = coffee.compile(code, options)
      result = {js: result} unless options.sourceMap

      {
        code: result.js
        sourceMap: result.v3SourceMap ? null
        toScopeName: 'source.js'
      }
