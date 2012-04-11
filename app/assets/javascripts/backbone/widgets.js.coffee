class Kandan.Widgets
  @template: JST['widget']
  @widgets: {}

  @register: (widgetNamespace)->
    @widgets[widgetNamespace] = "widget_#{Object.size(@widgets)}"

  @all: ()->
    @widgets

  @initAll: ()->
    @init(widgetNamespace) for widgetNamespace of @widgets


  @init: (widgetNamespace)->
    widget = eval(widgetNamespace)
    $(".sidebar .widgets").append(
      @template({
        element_id: @widgets[widgetNamespace],
        title: widget.widget_title,
        icon_url: widget.widget_icon_url
      })
    )
    @render(widgetNamespace)


  @render: (widgetNamespace)->
    $widgetEl = $("##{@widgets[widgetNamespace]}")
    eval(widgetNamespace).render($widgetEl) if $widgetEl != []
