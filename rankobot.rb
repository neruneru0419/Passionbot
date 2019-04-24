require 'twitter'
require 'aws-sdk-v1'

twClient = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['MY_CONSUMER_KEY']
  config.consumer_secret = ENV['MY_CONSUMER_SECRET']
  config.access_token    = ENV['MY_ACCESS_TOKEN']
  config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

AWS.config({
    :access_key_id => ENV['AWS_ACCESS_KEY'],
    :secret_access_key => ENV['AWS_ACCESS_SECRET'],
})
s3 = AWS::S3.new
bucket = s3.buckets["neruneru"]
flg = true
loop do
	time = Time.new
	
	if time.min % 20 == 0 && flg then
        passion = rand(1081) + 1
        pic = bucket.objects["ranko/ranko#{passion}.png"]
		puts passion
		rankopic = pic.read
		res = twClient.update_with_media("このツイートはパッションの#{passion}枚目のスクショです", rankopic)
		puts res
		flg = false
	end
		
	if time.min % 20 == 1 then
		flg = true
	end
end
