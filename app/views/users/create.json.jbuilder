json.user do
  json.extract! @user, :id, :name, :last_name, :email, :authentication_token
end