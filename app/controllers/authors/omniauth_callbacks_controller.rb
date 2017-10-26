class Authors::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    pp @omniauth
    if @omniauth.present?
      @profile = SocialProfile.select_provider(@omniauth['provider'], @omniauth['uid']).first
      unless @profile
        @profile = SocialProfile.select_provider(@omniauth['provider'], @omniauth['uid']).new
        @profile.author = current_author || set_author_socila_profile(@profile)
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
    author = Author.new(name: profile.name)
    author.social_profiles << profile
    author
  end
end
