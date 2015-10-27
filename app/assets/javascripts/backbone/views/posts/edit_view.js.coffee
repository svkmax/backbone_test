BackboneTest.Views.Posts ||= {}

class BackboneTest.Views.Posts.EditView extends Backbone.View
  template: JST["backbone/templates/posts/edit"]

  events:
    "submit #edit-post": "update"

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
