module AuthenticationMacros
  def login_author(author)
    controller.stub(:authenticate_author!).and_return true
    @request.env['devise.mapping'] = Devise.mappings[:author]
    sign_in author
  end
end
