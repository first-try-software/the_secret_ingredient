require_relative "../app/ruby_conf"

RSpec.describe RubyConf do
  describe "#in_progress?" do
    it "returns false before RubyConf" do
      ruby_conf = RubyConf.new

      expect(ruby_conf.in_progress?).to be(false)
    end
  end
end
