json.array! @errors do |error|
  json.extract! error, :id, :title, :details, :resolver
end
