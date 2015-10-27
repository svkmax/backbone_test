BackboneTest.Views.Posts ||= {}

class BackboneTest.Views.Posts.EditView extends Backbone.View
  template: JST["backbone/templates/posts/edit"]

  events:
    "submit #edit-post": "update",
    "click .destroy" : "destroy"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    this.handleError(@model, @model.validationError) unless @model.isValid()
    @model.save(null,
      success: (post) =>
        @model = post
        window.location.hash = "/#{@model.id}"
    ) if @model.isValid()

  handleError: (model, errors) =>
    $(".validation-error").html("✗ " + _.pluck(errors, 'message').join(" ") )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this

  destroy: () ->
    @model.destroy()
    this.remove()
    window.location.hash = "/index"
    return false