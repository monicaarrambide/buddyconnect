# frozen_string_literal: true

module IntegrationSpecHelper
  def login_with_oauth(service = :google_oauth2)
    visit("/auth/#{service}")
  end
end
