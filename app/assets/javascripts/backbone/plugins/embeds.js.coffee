class Kandan.Plugins.Embeds

  @image_regex:   /^http.*\.(jpg|jpeg|gif|png)/i


  @init: ()->
    @register_youtube_modifier()
    @register_image_modifier()
    @register_link_modifier()


# Kandan.Plugins.register "Kandan.Plugins.Embeds"