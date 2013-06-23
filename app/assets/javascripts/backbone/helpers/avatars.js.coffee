class Kandan.Helpers.Avatars
  @urlFor: (a, options) ->
    size = options.size || 30
    fallback = options.fallback || Kandan.options().avatar_fallback || 'mm'
    avatarHash = a.gravatar_hash || a.get('user').gravatar_hash || a.get('gravatarHash')
    try
        avatarUrl = a.avatar_url || a.get('user').avatar_url || a.get('avatarUrl')
    catch error
        console.log "Error occuried while resolving user avatar: #{error}"
    avatarUrl or Kandan.options().avatar_url.replace(/%{hash}/, avatarHash).
        replace(/%{size}/, size).
        replace(/%{fallback}/, fallback)
