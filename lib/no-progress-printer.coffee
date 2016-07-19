{CompositeDisposable} = require 'atom'

module.exports = NoProgressPrinter =
  subscriptions: null

  activate: (state) ->

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'no-progress-printer:print': => @print()

  deactivate: ->
    @subscriptions.dispose()

  print: ->
    if editor = atom.workspace.getActiveTextEditor()
      figlet = require "figlet"
      figlet "No Progress", (error, art) ->
        if error
          console.error (error)
        else
          editor.insertText("\n#{art}\n")
