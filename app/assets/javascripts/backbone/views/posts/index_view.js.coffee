BackboneTest.Views.Posts ||= {}

class BackboneTest.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (post) =>
    view = new BackboneTest.Views.Posts.PostView({model : post})
    @$(".block msg_list_block").append(view.render().el)

  render: =>
    @$el.html(@template(posts: @collection.toJSON() ))
    @addAll()

    return this
