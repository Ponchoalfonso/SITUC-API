json.user do
  json.extract! @user, :id, :email, :name, :last_name, :credit
end