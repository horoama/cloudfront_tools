require 'aws-sdk-cloudfront'

class Signer
    def initialize(cloudfront_domain, key_pair_id, private_key)
        @signer = Aws::CloudFront::UrlSigner.new(
            key_pair_id:    key_pair_id,
            private_key:    private_key
        )
        @domain = cloudfront_domain
    end

    def generate_url(filename, expires_time)
        signed_url = @signer.signed_url(
            'https://' + @domain + '/' + filename,
            expires: expires_time
        )
    end
end
