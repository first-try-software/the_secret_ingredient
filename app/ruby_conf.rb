require "time"
require "httparty"

require_relative "cache"

class RubyConf
  def favorite_session=(title)
    Cache.instance.set(:favorite_session, title)
  end

  def favorite_session
    Cache.instance.get(:favorite_session) || "Matz's Keynote"
  end

  def session_description(title:)
    response = HTTParty.get("https://rubyconf-2023.sessionize.com/api/schedule")

    parsed_body = JSON.parse(response.body, symbolize_names: true)

    selected_sessions = parsed_body[:sessions].select do |session|
      session[:title].include?(title)
    end

    selected_sessions.first[:description] unless selected_sessions.first.nil?
  end

  def raffle_winner?(attendee_number)
    attendee_number == raffle_winner
  end

  def raffle_winner
    @raffle_winner ||= Random.rand(1...500)
  end

  def in_progress?
    now = DateTime.now
    start_at = DateTime.parse("2023-11-13")
    end_at = (DateTime.parse("2023-11-15") + 1)

    now.between?(start_at, end_at)
  end
end
