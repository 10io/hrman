DEPARTMENTS = %w(hr it director operations sales)
20.times do
  first_name = Faker::Name.first_name
  Employee.create!(
    :first_name => first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email(first_name),
    :phone => Faker::PhoneNumber.phone_number,
    :department => DEPARTMENTS.sample(1).first
  )
end
