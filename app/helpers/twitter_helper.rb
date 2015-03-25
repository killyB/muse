module TwitterHelper
  def self.get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "ktixfOgp1vKTKFC49eWMEj6Pd"
      config.consumer_secret = "oemekHGQ9R3GfaWRitOdH4FHILvGaNG5EkRYBMKIicDy0dTDx8"
      config.access_token = "126391458-2sAqD5NGSKeuMYQioKEhPVKiv7uo2S2i1d95C3t4"
      config.access_token_secret = "28Rbb8jOYxClnbdaWfVISA4mcTBNbRieCl0jNw7LAQalZ"
    end
  end

  def get_client
    TwitterHelper.client
  end
end