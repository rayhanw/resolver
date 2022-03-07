json.array! @errors do |error|
  json.extract! error, :title, :details, :resolver
end
