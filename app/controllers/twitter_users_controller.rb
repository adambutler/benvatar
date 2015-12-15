require "RMagick"

class TwitterUsersController < ApplicationController
  def create
    @uuid = SecureRandom.uuid
    @twitter_user = TwitterUser.create(auth_hash: request.env['omniauth.auth'])

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = @twitter_user.auth_hash.credentials.token
      config.access_token_secret = @twitter_user.auth_hash.credentials.secret
    end

    img = Magick::Image.read(client.user.profile_image_url(:original)).first

    watermark = Magick::Image.read("public/benweek.png").first
    watermark.background_color = "Transparent"

    overlay = img.dissolve(watermark, 0.4, 1, Magick::CenterGravity)
    overlay.write("public/#{@uuid}.jpg")

    client.update_profile_image(Base64.encode64(File.read("public/#{@uuid}.jpg")))
  end
end
