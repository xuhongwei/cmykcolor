module ApplicationHelper
  # get user's avatar_url
  def avatar_url(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
