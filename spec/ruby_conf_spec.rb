require_relative "../app/ruby_conf"

RSpec.describe RubyConf do
  describe "#favorite_session" do
    it "sets a default favorite session" do
      ruby_conf = RubyConf.new

      expect(ruby_conf.favorite_session).to eq("Matz's Keynote")
    end
  end

  describe "#favorite_session=" do
    it "caches my favorite session" do
      ruby_conf_1 = RubyConf.new
      ruby_conf_1.favorite_session = "The Secret Ingredient"

      ruby_conf_2 = RubyConf.new

      expect(ruby_conf_2.favorite_session).to eq("The Secret Ingredient")
    end
  end

  describe "#session_description" do
    it "fetches the session description" do
        url = "https://rubyconf-2023.sessionize.com/api/schedule"
        title = "The Secret Ingredient"
        description = "Flaky tests are an inscrutable bane."

        body = {
          sessions: [
            { title: "Title A", description: "Description 1." },
            { title: title, description: description },
            { title: "Title B", description: "Description 2." }
          ]
        }
        response = instance_double("response", body: body.to_json)
        allow(HTTParty).to receive(:get).with(url).and_return(response)

        ruby_conf = RubyConf.new

        expect(ruby_conf.session_description(title: title)).to include(description)
    end
  end

  describe "#raffle_winner?" do
    it "returns false when the attendee did not win the raffle" do
      allow(Random).to receive(:rand).and_return(42)

      ruby_conf = RubyConf.new

      expect(ruby_conf.raffle_winner?(1)).to be false
    end

    it "returns true when the attendee won the raffle" do
      allow(Random).to receive(:rand).and_return(42)

      ruby_conf = RubyConf.new

      expect(ruby_conf.raffle_winner?(42)).to be true
    end
  end

  describe "#raffle_winner" do
    it "returns a number between 1 and 500" do
      ruby_conf = RubyConf.new

      expect(ruby_conf.raffle_winner).to be_between(1, 500)
    end
  end

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
