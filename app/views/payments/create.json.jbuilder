json.payment do
  json.extract! @payment, :amount, :created_at
  json.user do
    json.extract! @payment.user, :name, :last_name, :credit
  end
  json.bus do
    json.extract!@payment.bus, :id, :route_name
  end
end