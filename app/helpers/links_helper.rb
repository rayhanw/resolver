module LinksHelper
  def links
    {
      bug: "https://github.com/rayhanw/resolver/issues/new?assignees=rayhanw&labels=bug&template=bug_report.md&title=",
      codebase: "https://github.com/rayhanw/resolver",
      avatar: "https://avatars.githubusercontent.com/u/20383179?v=4",
      website: "https://rayhanw.com",
      rbe: "https://doc.rust-lang.org/rust-by-example/",
      northcoder: "https://northcoders.com/company/blog/making-friends-with-errors-in-your-code"
    }
  end

  def socials
    [
      {
        text: "Github",
        url: "https://github.com/rayhanw"
      },
      {
        text: "Website",
        url: "https://rayhanw.com"
      }
    ]
  end

  def website_mail
    {
      email: "contact@resolver.site",
      text: "Mail us"
    }
  end
end
