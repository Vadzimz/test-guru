module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(name:, repo:)
    "https://github.com/" + "#{name}/#{repo}"
  end
end
