class BackboneTest.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: ''
    name: ''
    message: ''
    created_at: ''

  validate: (attrs) ->
    errors = []
    unless attrs.title
      errors.push
        name: "title"
        message: "Please fill titile field."

    unless attrs.name
      errors.push
        name: "name"
        message: "Please fill name field."

    unless attrs.message
      errors.push
        name: "message"
        message: "Please fill message field."
    (if errors.length > 0 then errors else false)

class BackboneTest.Collections.PostsCollection extends Backbone.Collection
  model: BackboneTest.Models.Post
  url: '/posts'
