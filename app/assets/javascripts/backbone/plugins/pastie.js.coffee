class Kandan.Plugins.Pastie
  @regex: /\n.*\n/i
  @options:
    maxPreviewLength: 300
    maxPreviewLines:  4

  @template: _.template('''
    <pre class="pastie">
      <a target="_blank" class="pastie-link" href="<%= message_link %>">View pastie</a>
      <br/><%= preview %>
    </pre>
    ''')

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state) =>
      url = "/channels/#{message.channel_id}/activities/#{message.id}"
      message.content = @template({preview: message.content, message_link: url})
      console.log "pastie man!"
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.Pastie"