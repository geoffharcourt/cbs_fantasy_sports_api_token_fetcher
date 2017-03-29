require "spec_helper"

describe CbsFantasySportsApiTokenFetcher do
  it "has a version number" do
    expect(CbsFantasySportsApiTokenFetcher::VERSION).not_to be nil
  end

  describe "#fetch" do
    it "fetches the token from CBS" do
      stub_cbs_response

      result = CbsFantasySportsApiTokenFetcher.new(
        league_name: "wundersport.baseball",
        password: "myvoiceismypassport",
        user_id: "me@example.com",
      ).fetch

      expect(result).to eq(token)
    end

    it "uses the correct credentials" do
      stub_cbs_response

      CbsFantasySportsApiTokenFetcher.new(
        league_name: "wundersport.baseball",
        password: "myvoiceismypassport",
        user_id: "me@example.com",
      ).fetch

      expect(HTTParty).to have_received(:post).with(
        CbsFantasySportsApiTokenFetcher::URL,
        body: {
          userid: "me@example.com",
          password: "myvoiceismypassport",
          xurl: "https://wundersport.baseball.cbssports.com/",
        },
      )
    end

    let(:token) { "abcdefg123456" }

    def stub_cbs_response
      response = instance_double(
        HTTParty::Response,
        body: "asdlkvartoken=as;dlfkjasdd var token = \"#{token}\";asdfasdfa"
      )
      allow(HTTParty).to receive(:post).and_return(response)
    end
  end
end
