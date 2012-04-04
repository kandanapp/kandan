class Kandan.Widgets
  @widgets: {}

  @register: (widget_namespace)->
    @widgets[widget_namespace] = "widget_#{Object.size(@widgets)}"

  @all: ()->
    @widgets

  @initAll: ()->
    $.each @widgets, (widget_namespace, el_name)=>
      @init(widget_namespace)

  @template: JST['widget']

  @init: (widget_namespace)->
    widget = eval(widget_namespace)
    $(".sidebar .widgets").append(@template({
      element_id: @widgets[widget_namespace],
      title: widget.widget_title,
      icon_url: widget.widget_icon_url
    }))
    @render(widget_namespace)


  @render: (widget_namespace)->
    $widget_el = $("##{@widgets[widget_namespace]}")
    eval(widget_namespace).render($widget_el) if $widget_el != []
