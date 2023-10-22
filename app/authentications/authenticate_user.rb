class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    auth_token = JwtService.encode(user_id: user.id) if user
    current_user = User.find_by!(email: @email)
    current_user.jti = auth_token
    current_user.save 
    return auth_token
  end

  private

  def user
    user = User.find_by!(email: @email)
    return user if user&.authenticate(@password)

    errors.add(:user_authentication, "Invalid Credentials")
    return nil
  end
end