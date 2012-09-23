class Browl
  notifications = {}
  defaults =
    container:
      class: ".browl-container"
      position: "top-right"
    notification:
      class: ".browl-notification"
      template: (icon = "", title = "", message = "") ->
        $("<li class='browl-notification out'><div class='icon'>#{icon}</div><div class='content'><div class='title'>#{title}</div><div class='message'>#{message}</div></div></li>")

  @notify: ->
    $container    = $(defaults.container.class)
    $template     = defaults.notification.template.apply this, arguments
    $notification = $template.appendTo $container

    $container.width($container.width())
    $notification.removeClass("out")

    setTimeout ->
      $notification.on "webkitTransitionEnd transitionend", ->
        $notification.remove()
      $notification.css
        opacity: 0
        marginTop: -$notification.outerHeight() + 1
    , 5000