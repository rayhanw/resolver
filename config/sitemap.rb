# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.example.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  Error.find_each do |error|
    # Error show page
    # [/errors/:id]
    add error_path(error), lastmod: error.updated_at
  end

  # Docs page [/docs]
  add docs_path

  # About page [/about]
  add about_path

  # API/v1/errors index page
  # [/api/v1/errors]
  add api_v1_errors_path, changefreq: 'weekly'

  # API/v1/errors show page
  # [/api/v1/error]
  add api_v1_show_api_path, changefreq: 'weekly'
end
