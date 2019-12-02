json.array! @payments do |payment|
    json.extract! payment, :amount, :created_at
    json.bus payment.bus, :route_name
end