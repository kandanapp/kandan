module AvatarHelper
  def avatar_url_for(user, options = {})
  	if user.avatar_url and user.avatar_url.length > 0
  		user.avatar_url
  	else
	  	Kandan::Config.options[:avatar_url].gsub(/%{hash}/, user.gravatar_hash).
	      gsub(/%{size}/, (options[:size] || 30).to_s).
	      gsub(/%{fallback}/, options[:fallback] || Kandan::Config.options[:avatar_fallback] || 'mm')
	end
  end
end
