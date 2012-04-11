class Kandan.Plugins.Attachments

  @widget_title: "Media"
  @widget_icon_url: "/assets/media_icon.png"
  @plugin_namespace: "Kandan.Plugins.Attachments"

  @dropzoneInit: false

  @options:
    maxFileNameLength: 20
    defaultDropzoneText: "Drop file here to upload"

  @templates:
    no_files: _.template '''
      <div style="text-align:center; text-transform: uppercase; font-size: 11px; color: #999; padding: 10px;">
        No media yet. Try uploading.
      </div>
    '''

    dropzone: _.template '''
      <form accept-charset="UTF-8" action="/channels/<%= channel_id %>/attachments.json" data-remote="true" html="{:multipart=&gt;true}" id="file_upload" method="post">
          <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓">
            <input name="<%=csrf_param %>" type="hidden" value="<%= csrf_token %>"/>
          </div>
          <input id="channel_id_<%= channel_id %>" name="channel_id[<%= channel_id %>]" type="hidden"/>
          <input id="file" name="file" type="file"/>
          <div class="dropzone"><%= dropzoneText %></div>
      </form>
    '''

  @supports_drop_upload: ()->
    !!(window.File && window.FileList && window.FileReader)

  @channel_id: ()->
    Kandan.Data.Channels.activeChannelId()

  @csrf_param: ->
    $('meta[name=csrf-param]').attr('content')

  @csrf_token: ->
    $('meta[name=csrf-token]').attr('content')

  @truncateName: (fileName)->
    return "#{fileName.substring(0, @options.maxFileNameLength)}..." if fileName.length > @options.maxFileNameLength
    fileName

  @fileIcon: (fileName)->
    fileExtension = fileName.split(".").pop()
    return "/assets/img_icon.png"   if fileExtension.match(/(png|jpeg|jpg|gif)/i)
    return "/assets/audio_icon.png" if fileExtension.match(/(mp3|wav|m4a)/i)
    return "/assets/video_icon.png" if fileExtension.match(/(mov|mpg|mpeg|mp4)/i)
    return "/assets/file_icon.png"

  @file_item_template: _.template '''
    <div class="file_item">
      <a href="<%= url %>">
        <img src="<%= iconUrl %>"/>
        <span><%= fileName %></span>
      </a>
    </div>
  '''

  # TODO this part is very bad for APIs! shoudnt be exposing a backbone collection in a plugin.
  @render: ($widget_el)->
    $upload_form = @templates.dropzone({
      channel_id:   @channel_id(),
      csrf_param:   @csrf_param(),
      csrf_token:   @csrf_token(),
      dropzoneText: @options.defaultDropzoneText
    })

    $widget_el.next().html($upload_form)
    $widget_el.next(".action_block").html($upload_form)

    populate = (collection)=>
      if collection.models.length > 0
        $file_list = $("<div class='file_list'></div>")
        for model in collection.models
          $file_list.append(@file_item_template({
            fileName: @truncateName(model.get('file_file_name')),
            url: model.get('url')
            iconUrl: @fileIcon(model.get('file_file_name'))
          }))
      else
        $file_list = @templates.no_files()
      $widget_el.html($file_list)

    Kandan.Data.Attachments.all(populate)


  @initDropzone: ->
    $(".dropzone").filedrop({
      fallback_id: "file"
      paramname  : "file"
      maxfilesize: 1000
      queuefiles : 1

      url: ->
        "/channels/#{ Kandan.Data.Channels.activeChannelId() }/attachments.json"

      uploadStarted: ->
        $(".dropzone").text("Uploading...")

      uploadFinished: (i, file, response, time)->
        console.log "Upload finished!"

      error: (err, file)->
        if err == "BrowserNotSupported"
          $(".dropzone").text("Browser not supported")
        else if err == "FileTooLarge"
          $(".dropzone").text("File too large")
        else
          $(".dropzone").text("Sorry bud! couldn't upload")


      progressUpdated: (i, file, progress)->
        $(".dropzone").text("#{progress}% Uploaded")
        if progress == 100
          console.log "100% done"
          $(".dropzone").text("#{progress}% Uploaded")
          Kandan.Widgets.render "Kandan.Plugins.Attachments"

      dragOver: ->
        console.log "reached dropzone!"
    })

  @init: ()->
    @initDropzone()
    Kandan.Widgets.register @plugin_namespace

    Kandan.Data.Attachments.registerCallback "change", ()=>
      Kandan.Widgets.render @plugin_namespace

    Kandan.Data.Channels.registerCallback "change", ()=>
      Kandan.Widgets.render @plugin_namespace
