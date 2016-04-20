json.character @character['name']
json.description @character['description']
json.repos do
  json.repos_count @repos.count
  json.items do
    json.array! @repos do |repo|
      json.name repo.full_name
      json.url  repo.html_url
    end
  end
end
