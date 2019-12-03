json.user do
  json.extract! @user, :email, :name, :last_name, :credit
end