class ActionDispatch::IntegrationTest
 # include Warden::Test::Helper   this gives me a lot of errors
  
  def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end
end

#email "kieu1@example.com"
# password "abc123456"