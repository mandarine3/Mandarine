CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJLNK436TDJ6VPL4A',                        # required
    aws_secret_access_key: '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',    # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
                                                               # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'leegyul'                                      # required
  config.fog_attributes = {} # optional, defaults to {}
end