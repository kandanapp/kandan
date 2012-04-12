class Kandan.Plugins.Emoticons

  @options:
    regex: /\([a-zA-Z]\)/g
    template: _.template '''
      <img class="emoticon-embed" src="/assets/<%= emoticon %>" height="20" width="20" />
    '''


  @emoticons: {
    "(yuno)": "y_u_no.jog"
    }

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      matches = message.content.match(@regex)
      for match in _.unique(matches)
        emoticon    = @emoticons[match]
        search      = new Regex(match, 'g')
        replacement = @options.template({ emoticon: emoticon })
        message.content.replace(search, replacement) if emoticon
      return Kandan.Helpers.Activities.build_from_base_template(message)

# Kandan.Plugins.register "Kandan.Plugins.Emoticons"
