require "httparty"

class CbsFantasySportsApiTokenFetcher
  TOKEN_REGEX = /(?<=var token = ").+(?=")/
  URL = "https://www.cbssports.com/login".freeze
  VERSION = "0.1.0"

  def initialize(league_name:, password:, user_id:)
    @league_name = league_name
    @password = password
    @user_id = user_id
  end

  def fetch
    page.match(TOKEN_REGEX).to_s
  end

  private

  attr_reader :league_name, :password, :user_id

  def page
    @_page ||= HTTParty.post(
      URL,
      body: { userid: user_id, password: password, xurl: xurl }
    ).body
  end

  def xurl
    "https://#{league_name}.cbssports.com/"
  end
end
