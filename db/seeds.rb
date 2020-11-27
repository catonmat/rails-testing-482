# destroy all models
User.destroy_all
Product.destroy_all

# create 5 products
5.times do |i|
  product = Product.create!(name: Faker::Company.name, tagline: Faker::Company.catch_phrase)
  puts "Created product: #{i+1} -> #{product.name}"
end

# create 1 user
User.create!(first_name: 'John', last_name: 'Doe', email: 'john@email.com', password: '123456')
