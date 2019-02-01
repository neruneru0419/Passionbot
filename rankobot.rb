require 'twitter'
 
twClient = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['MY_CONSUMER_KEY']
  config.consumer_secret = ENV['MY_CONSUMER_SECRET']
  config.access_token    = ENV['MY_ACCESS_TOKEN']
  config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

flg = true
loop do
	time = Time.new
	
	if time.min % 20 == 0 && flg then
		passion = rand(400) + 1
		puts passion
		rankopic = File.new("ranko/neruneru#{passion}.png")
		res = twClient.update_with_media("このツイートはパッションの#{passion}枚目のスクショです", rankopic)
		puts res
		flg = false
	end
		
	if time.min % 20 == 1 then
		flg = true
	end
end
