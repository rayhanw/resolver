entries = YAML.load_file(Rails.root.join("db", "data", "errors.yml")).map { |ele| ele.transform_keys(&:to_sym) }

Error.destroy_all
puts "Removing all errors"

entries.each do |entry|
  error = Error.create!(entry)

  puts "Error ##{error.id} created!"
end
