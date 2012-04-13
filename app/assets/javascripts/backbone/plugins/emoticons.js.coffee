class Kandan.Plugins.Emoticons

  @options:
    regex: /\([a-zA-Z]+\)/g
    template: _.template '''
      <img class="emoticon-embed" src="/assets/emoticons/<%= emoticon %>" title="<%= title %>" height="40" width="40" />
    '''


  @emoticons: {
    "(alone)"       : "alone.jpg",
    "(awwyea)"      : "awwyea.jpg",
    "(badass)"      : "badass.png",
    "(bitchplease)" : "bitchplease.jpg",
    "(cereal)"      : "cereal.jpg",
    "(challenge)"   : "challenge.jpg",
    "(fuckyeah)"    : "fuckyeah.jpg",
    "(gtfo)"        : "seriously.jpg",
    "(ilied)"       : "ilied.jpg",
    "(megusta)"     : "megusta.jpg",
    "(notbad)"      : "notbad.jpg",
    "(okay)"        : "okay.jpg",
    "(omgface)"     : "omgface.jpg",
    "(pokerface)"   : "pokerface.jpg",
    "(problem)"     : "trollface.jpg",
    "(rageguy)"     : "rageguy.jpg",
    "(seriously)"   : "seriously.jpg",
    "(sweetjesus)"  : "sweetjesus.jpg",
    "(trollface)"   : "trollface.jpg",
    "(truestory)"   : "truestory.png",
    "(youdontsay)"  : "youdontsay.png",
    "(yuno)"        : "yuno.jpg"
    }

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      matches = message.content.match(@options.regex)
      for match in _.unique(matches)
        emoticon    = @emoticons[match]
        title       = match.replace(/\(|\)/g, "")
        needle      = match.replace('(', '\\(').replace(')', '\\)')
        search      = new RegExp(needle, 'g')
        replacement = @options.template({ emoticon: emoticon, title: title})
        message.content = message.content.replace(search, replacement) if emoticon
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)

# Kandan.Plugins.register "Kandan.Plugins.Emoticons"
