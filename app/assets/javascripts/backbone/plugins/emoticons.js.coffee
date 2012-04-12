class Kandan.Plugins.Emoticons

  @options:
    regex: /\([a-zA-Z]+\)/g
    template: _.template '''
      <img class="emoticon-embed" src="/assets/emoticons/<%= emoticon %>" height="20" width="20" />
    '''


  @emoticons: {
    "(alone)"       : "alone.jpg",
    "(awwyea)"      : "awwyea.jpg",
    "(badass)"      : "badass.png",
    "(bitchplease)" : "bitchplease.jpg",
    "(cereal)"      : "cereal.jpg",
    "(challenge)"   : "challenge.jpg",
    "(fuckyeah)"    : "fuckyeah.jpg",
    "(ilied)"       : "ilied.jpg",
    "(megusta)"     : "megusta.jpg",
    "(notbad)"      : "notbad.jpg",
    "(okay)"        : "okay.jpg",
    "(omgface)"     : "omgface.jpg",
    "(pokerface)"   : "pokerface.jpg",
    "(rageguy)"     : "rageguy.jpg",
    "(seriously)"   : "seriously.jpg",
    "(sweetjesus)"  : "sweetjesus.jpg",
    "(truestory)"   : "truestory.jpg",
    "(youdontsay)"  : "youdontsay.png",
    "(yuno)"        : "yuno.jpg"
    }

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      matches = message.content.match(@options.regex)
      for match in _.unique(matches)
        emoticon    = @emoticons[match]
        needle      = match.replace('(', '\\(').replace(')', '\\)')
        search      = new RegExp(needle, 'g')
        console.log(search)
        replacement = @options.template({ emoticon: emoticon })
        message.content = message.content.replace(search, replacement) if emoticon
        console.log(message.content)
      return Kandan.Helpers.Activities.buildFromBaseTemplate(message)

# Kandan.Plugins.register "Kandan.Plugins.Emoticons"
