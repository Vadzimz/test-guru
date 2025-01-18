module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(name:, repo:, description:)
    link_to description, "https://github.com/" + "#{name}/#{repo}"
  end
end
