class Kandan.Plugins.Attachments

  @widget_title: "Attachments"
  @plugin_namespace: "Kandan.Plugins.Attachments"

  @template: _.template('''
    <form accept-charset="UTF-8" action="/channels/<%= channel_id %>/attachments.json" data-remote="true" html="{:multipart=&gt;true}" id="file_upload" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓">
      <input name="<%=csrf_param %>" type="hidden" value="<%= csrf_token %>"></div>
      <input id="channel_id_<%= channel_id %>" name="channel_id[<%= channel_id %>]" type="hidden">
      <input id="file" name="file" type="file">
      <input name="commit" type="submit" value="Upload">
   </form>
  ''')

  @channel_id: ()->
    Kandan.Data.Channels.active_channel_id()

  @csrf_param: ->
    $('meta[name=csrf-param]').attr('content')


  @csrf_token: ->
    $('meta[name=csrf-token]').attr('content')


  @render: ($widget_el)->
    $upload_form = @template({
      channel_id: @channel_id(),
      csrf_param: @csrf_param(),
      csrf_token: @csrf_token()
    })
    $widget_el.append($upload_form)
    # $widget_el.append($file_list)


  @init: ()->
    Kandan.Widgets.register "attachments", @plugin_namespace
    Kandan.Data.Channels.register_callback "change", ()=>
      console.log "channel changed"
      #Kandan.Widgets.render(@widget_name)


Kandan.Plugins.register "Kandan.Plugins.Attachments"