class Kandan.Plugins.Attachments

  @widget_title: "Media"
  @widget_icon_url: "/assets/media_icon.png"
  @pluginNamespace: "Kandan.Plugins.Attachments"

  @dropzoneInit: false

  @options:
    maxFileNameLength: 20
    defaultDropzoneText: "Drop file here to upload"

  @templates:
    noFiles: _.template '''
      <div class="no-media">
        No media yet. Try uploading.
      </div>
    '''

    dropzone: _.template '''
      <form accept-charset="UTF-8" action="/channels/<%= channelId %>/attachments.json" data-remote="true" html="{:multipart=&gt;true}" id="file_upload" method="post">
          <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓">
            <input name="<%=csrfParam %>" type="hidden" value="<%= csrfToken %>"/>
          </div>
          <input id="channel_id_<%= channelId %>" name="channel_id[<%= channelId %>]" type="hidden"/>
          <input id="file" name="file" type="file"/>
          <div class="dropzone"><%= dropzoneText %></div>
      </form>
    '''

    fileItemTemplate: _.template '''
      <li class="file_item">
        <a target="_blank" href="<%= url %>">
          <img src="<%= iconUrl %>"/>
          <span><%= fileName %></span>
        </a>
      </li>
    '''

  @csrfParam: ->
    $('meta[name=csrf-param]').attr('content')


  @csrfToken: ->
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



  # TODO this part is very bad for APIs! Shouldn't be exposing a backbone collection in a plugin.
  @render: ($widgetEl)->
    $uploadForm = @templates.dropzone({
      channelId:    Kandan.Data.Channels.activeChannelId(),
      csrfParam:    @csrfParam(),
      csrfToken:    @csrfToken(),
      dropzoneText: @options.defaultDropzoneText
    })

    $widgetEl.next().html($uploadForm)
    $widgetEl.next(".action_block").html($uploadForm)

    populate = (collection)=>
      if collection.models.length > 0
        $fileList = $("<ul class='file_list'></ul>")
        for model in collection.models
          $fileList.append(
            @templates.fileItemTemplate({
              fileName: @truncateName(model.get('file_file_name')),
              url:      model.get('url')
              iconUrl:  @fileIcon(model.get('file_file_name'))
            })
          )
      else
        $fileList = @templates.noFiles()
      $widgetEl.html($fileList)
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
          $(".dropzone").text("#{progress}% Uploaded")
          Kandan.Widgets.render "Kandan.Plugins.Attachments"

      dragOver: ->
        console.log "reached dropzone!"
        $(".dropzone").text("UPLOAD!")

      dragLeave: ->
        console.log "left dropzone!"
        $(".dropzone").text("Drop file here to upload")
    })


  @init: ()->
    @initDropzone()
    Kandan.Widgets.register @pluginNamespace

    Kandan.Data.Attachments.registerCallback "change", ()=>
      Kandan.Widgets.render @pluginNamespace

    Kandan.Data.Channels.registerCallback "change", ()=>
      Kandan.Widgets.render @pluginNamespace
