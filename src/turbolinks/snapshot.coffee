#= require turbolinks/element_set

class Turbolinks.Snapshot
  @fromHTML: (html) ->
    element = document.createElement("html")
    element.innerHTML = html
    new this
      head: element.querySelector("head")
      body: element.querySelector("body")

  constructor: ({head, body, scrollLeft, scrollTop}) ->
    @head = head
    @body = body
    @scrollLeft = scrollLeft
    @scrollTop = scrollTop

  hasScrollPosition: ->
    @scrollLeft? and @scrollTop?

  hasSameTrackedHeadElementsAsSnapshot: (snapshot) ->
    @getTrackedHeadElementSet().isEqualTo(snapshot.getTrackedHeadElementSet())

  getInlineHeadElementsNotPresentInSnapshot: (snapshot) ->
    inlineStyleElements = @getInlineHeadStyleElementSet().getElementsNotPresentInSet(snapshot.getInlineHeadStyleElementSet())
    inlineScriptElements = @getInlineHeadScriptElementSet().getElementsNotPresentInSet(snapshot.getInlineHeadScriptElementSet())
    inlineStyleElements.getElements().concat(inlineScriptElements.getElements())

  getTemporaryHeadElements: ->
    @getTemporaryHeadElementSet().getElements()

  # Private

  getTrackedHeadElementSet: ->
    @trackedHeadElementSet ?= @getPermanentHeadElementSet().selectElementsMatchingSelector("[data-turbolinks-track=reload]")

  getInlineHeadStyleElementSet: ->
    @inlineHeadStyleElementSet ?= @getPermanentHeadElementSet().selectElementsMatchingSelector("style")

  getInlineHeadScriptElementSet: ->
    @inlineHeadScriptElementSet ?= @getPermanentHeadElementSet().selectElementsMatchingSelector("script:not([src])")

  getPermanentHeadElementSet: ->
    @permanentHeadElementSet ?= @getHeadElementSet().selectElementsMatchingSelector \
      "script, style, link[rel=stylesheet], [data-turbolinks-permanent], [data-turbolinks-track=reload]"

  getTemporaryHeadElementSet: ->
    @temporaryHeadElementSet ?= @getHeadElementSet().getElementsNotPresentInSet(@getPermanentHeadElementSet())

  getHeadElementSet: ->
    @headElementSet ?= new Turbolinks.ElementSet @head.childNodes
