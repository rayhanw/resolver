entries = YAML.load_file(Rails.root.join("db", "data", "errors.yml")).map { |ele| ele.transform_keys(&:to_sym) }
tag_names = %w[Rails ActiveStorage Javascript CSS Heroku]

User.destroy_all
Error.destroy_all

puts "Removing all errors"

User.create!(
  email: "admin@resolver.site",
  password: Rails.application.credentials.dig(:admin_password),
  admin: true
)

puts "Admin created"

entries.each do |entry|
  if Rails.env.production?
    attributes = { **entry, votes: 0 }
  else
    attributes = entry
  end
  error = Error.create!(attributes)

  puts "Error ##{error.id} created!"
end

tag_names.each do |name|
  Tag.create!(name: name)
end
