if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJNYPOVPEIP74QMZA'],
      :aws_secret_access_key => ENV['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'],
      :region => ENV['us-west-2']
    }
    config.fog_directory     =  ENV['scaleableinternetservices/xd-enterprises/']
  end
end