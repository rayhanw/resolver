entries = YAML.load_file(Rails.root.join("db", "data", "errors.yml")).map { |ele| ele.transform_keys(&:to_sym) }

User.destroy_all
Error.destroy_all

puts "Removing all errors"

User.create!(
  email: "admin@resolver.site",
  password: ")T*fOE7KNKBL7FwsqN@",
  admin: true
)

puts "Admin created"

entries.each do |entry|
  error = Error.create!(entry)

  puts "Error ##{error.id} created!"
end
