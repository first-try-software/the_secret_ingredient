require_relative "../app/ruby_conf"

RSpec.describe RubyConf do
  describe "#in_progress?" do
    it "returns false before RubyConf" do
      ruby_conf = RubyConf.new

      Timecop.freeze("2023-11-12") do
        expect(ruby_conf.in_progress?).to be(false)
      end
    end

    it "returns true during RubyConf" do
      ruby_conf = RubyConf.new

      Timecop.freeze("2023-11-14") do
        expect(ruby_conf.in_progress?).to be(true)
      end
    end

    it "returns false after RubyConf" do
      ruby_conf = RubyConf.new

      Timecop.freeze("2023-11-16") do
        expect(ruby_conf.in_progress?).to be(false)
      end
    end
  end
end
