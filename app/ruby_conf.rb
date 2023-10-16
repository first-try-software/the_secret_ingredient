require "time"

class RubyConf
  def in_progress?
    now = DateTime.now
    start_at = DateTime.parse("2023-11-13")
    end_at = (DateTime.parse("2023-11-15") + 1)

    now.between?(start_at, end_at)
  end
end
