module TwitterHelper
  def self.get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "G3Xp8jrXuLASCuMUXHkcdt2YH"
      config.consumer_secret = "0Wz3cuibK07i25TE0ilgY58CLnnU7QTcQZmv9KvWU7MNS6rYen"
      config.access_token = "3112886296-eVSeaV8kxFZwdsO2hp5ji3wafMTLcJ0RofyBeqZ"
      config.access_token_secret = "SUPyDKRhEkab00jhsSnsxv93nnYsp61xO6MEtG0hiZEHX"
    end
  end

  def get_client
    TwitterHelper.client
  end
end