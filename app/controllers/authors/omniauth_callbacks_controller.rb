class Authors::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      pp @omniauth
      @profile = SocialProfile.select_provider(@omniauth['provider'], @omniauth['uid']).first
      unless @profile
        @profile = SocialProfile.new(
            provider: @omniauth['provider'],
            uid: @omniauth['uid'],
            pen_name: @omniauth['info']['nickname'],
            image_url: @omniauth['info']['image'] )
        @profile.author = current_author || set_author_socila_profile(@profile)
        pp @profile.author
        @profile.save!
      end
      if current_author
        raise 'author is not identical' if current_author != @profile.author
      else
        sign_in(:author, @profile.author)
      end
      @profile.set_values(@omniauth)
    end
    redirect_to edit_author_registration_path
  end

  def set_author_socila_profile(profile)
    author = Author.new(pen_name: profile.pen_name)
    author.social_profiles << profile
    author
  end
end
