BackboneTest.Views.Posts ||= {}

class BackboneTest.Views.Posts.NewView extends Backbone.View
  template: JST["backbone/templates/posts/new"]

  events:
    "submit #new-post": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()

    @collection.create(@model.toJSON(),
      success: (post) =>
        @model = post
        window.location.hash = "/#{@model.id}"

      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    ) if @model.isValid()
    this.handleError(@model, @model.validationError) unless @model.isValid()

  handleError: (model, errors) =>
    $(".validation-error").html("✗ " + _.pluck(errors, 'message').join(" ") )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this