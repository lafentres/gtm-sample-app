if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     ENV["S3_ACCESS_KEY"],        # required
        aws_secret_access_key: ENV["S3_SECRET_KEY"],        # required
        region:  ENV['S3_REGION']
    }
    config.fog_directory  = ENV["S3_BUCKET_NAME"]              # required
  end
end