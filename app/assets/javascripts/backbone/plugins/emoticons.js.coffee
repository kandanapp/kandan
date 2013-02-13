class Kandan.Plugins.Emoticons

  @options:
    regex: /\([a-zA-Z]+\)|(^|\s)+([:|=][\)|\(|P|p])($|\s)/g
    template: _.template '''
      <img class="emoticon-embed <%= css %>" src="/assets/emoticons/<%= src %>" title="<%= title %>" />
    '''


  @emoticons: {
    "(alone)"       : { src : "alone.jpg", css : "big", title : "alone"},
    "(awwyea)"      : { src : "awwyea.jpg", css : "big", title : "awwyea"},
    "(badass)"      : { src : "badass.png", css : "big", title : "badass"},
    "(bitchplease)" : { src : "bitchplease.jpg", css : "big", title : "bitchplease"},
    "(cereal)"      : { src : "cereal.jpg", css : "big", title : "cereal"},
    "(challenge)"   : { src : "challenge.jpg", css : "big", title : "challenge"},
    "(fuckyeah)"    : { src : "fuckyeah.jpg", css : "big", title : "fuckyeah"},
    "(gtfo)"        : { src : "gtfo.png", css : "big", title : "gtfo"},
    "(ilied)"       : { src : "ilied.jpg", css : "big", title : "ilied"},
    "(megusta)"     : { src : "megusta.jpg", css : "big", title : "megusta"},
    "(notbad)"      : { src : "notbad.jpg", css : "big", title : "notbad"},
    "(okay)"        : { src : "okay.jpg", css : "big", title : "okay"},
    "(omgface)"     : { src : "omgface.jpg", css : "big", title : "omgface"},
    "(pokerface)"   : { src : "pokerface.jpg", css : "big", title : "pokerface"},
    "(problem)"     : { src : "trollface.jpg", css : "big", title : "problem"},
    "(rageguy)"     : { src : "rageguy.jpg", css : "big", title : "rageguy"},
    "(seriously)"   : { src : "seriously.jpg", css : "big", title : "seriously"},
    "(sweetjesus)"  : { src : "sweetjesus.jpg", css : "big", title : "sweetjesus"},
    "(trollface)"   : { src : "trollface.jpg", css : "big", title : "trollface"},
    "(truestory)"   : { src : "truestory.png", css : "big", title : "truestory"},
    "(youdontsay)"  : { src : "youdontsay.png", css : "big", title : "youdontsay"},
    "(yuno)"        : { src : "yuno.jpg", css : "big", title : "yuno"},
    ":("            : { src : "sad.png", css : "small", title : "sad"},
    "=("            : { src : "sad.png", css : "small", title : "sad"},
    ":)"            : { src : "happy.png", css : "small", title : "happy"},
    "=)"            : { src : "sad.png", css : "small", title : "happy"},
    ":p"            : { src : "tongue.png", css : "small", title : ":p"}
    "=p"            : { src : "tongue.png", css : "small", title : "=p"}
    }

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      matches = message.content.match(@options.regex)
      for match in _.unique(matches)
        match = match.trim();
        emoticon    = @emoticons[match]
        
        if emoticon
            needle = match.replace('(', '\\(').replace(')', '\\)')
            search = new RegExp(needle, 'g')
            replacement = @options.template(emoticon)
            message.content = message.content.replace(search, replacement) 

      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)