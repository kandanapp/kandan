class Kandan.Widgets
  @widgets: {}

  @register: (widget_namespace)->
    @widgets[widget_namespace] = "widget_#{Object.size(@widgets)}"

  @all: ()->
    @widgets

  @initAll: ()->
    $.each @widgets, (widget_namespace, el_name)=>
      @init(widget_namespace)

  @template: _.template '''
    <div class="widget" id="widget_<%= element_id %>">
      <div class="title"><%= title %></div>
      <div class="content" id="<%= element_id %>"></div>
    </div>
  '''

  @init: (widget_namespace)->
    widget = eval(widget_namespace)
    $(".sidebar .widgets").append(@template({
      element_id: @widgets[widget_namespace],
      title: widget.widget_title
    }))
    @render(widget_namespace)


  @render: (widget_namespace)->
    $widget_el = $("##{@widgets[widget_namespace]}")
    eval(widget_namespace).render($widget_el) if $widget_el != []
