json.extract! @error, :id, :title, :details, :resolver
json.tags @error.tags.pluck(:name)
