require "time"

class RubyConf
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
