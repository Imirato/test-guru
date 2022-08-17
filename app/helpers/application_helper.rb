# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url
    link_to 'TestGuru', 'https://github.com/Imirato/test-guru', target: '_blank'
  end
end
