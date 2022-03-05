module GithubHelper
  def gh_links
    {
      error: "https://github.com/rayhanw/resolver/issues/new?assignees=rayhanw&labels=enhancement&template=resolver-request.md&title=",
      bug: "https://github.com/rayhanw/resolver/issues/new?assignees=rayhanw&labels=bug&template=bug_report.md&title=",
      codebase: "https://github.com/rayhanw/resolver"
    }
  end
end
