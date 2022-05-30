entries = YAML.load_file(Rails.root.join("db", "data", "errors.yml")).map { |ele| ele.transform_keys(&:to_sym) }

Keyword.destroy_all
User.destroy_all
Error.destroy_all
Tag.destroy_all

puts "Removing all errors"

User.create!(
  email: "admin@resolver.site",
  password: Rails.application.credentials.dig(:admin_password),
  admin: true
)

puts "Admin created"

tags = {}

Tag::NAMES.each do |name|
  tag = Tag.create!(name: name)
  tags[name] = tag
end

entries.each do |entry|
  tag_keyword = entry[:category]
  entry.delete(:category)
  if Rails.env.production?
    attributes = { **entry, votes: 0 }
  else
    attributes = entry
  end

  error = Error.create!(attributes)

  tag_keyword.split(",").each do |k|
    Keyword.create!(
      error: error,
      tag: tags[k]
    )
  end

  puts "Error ##{error.id} created!"
end
