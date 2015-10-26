class BackboneTest.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    name: null
    message: null

class BackboneTest.Collections.PostsCollection extends Backbone.Collection
  model: BackboneTest.Models.Post
  url: '/posts'
