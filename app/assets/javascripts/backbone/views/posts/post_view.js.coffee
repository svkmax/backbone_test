BackboneTest.Views.Posts ||= {}

class BackboneTest.Views.Posts.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  events:
    "click .destroy" : "destroy",
    "click .message_item" : "show"

  tagName: "div"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this

  show: ->
    @$el.html(@template(@model.toJSON() ))
    return this
