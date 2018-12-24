require 'twitter'
 
#クライアントを作成
#twClientにキー情報を格納
twClient = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['MY_CONSUMER_KEY']
  config.consumer_secret = ENV['MY_CONSUMER_SECRET']
  config.access_token    = ENV['MY_ACCESS_TOKEN']
  config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

rankopic = []
flg = true

loop do
	time = Time.new
	if time.min % 20 == 0 && flg then
		#ツイートする
		passion = rand(100) + 1
		puts passion
		rankopic << File.new("picture/neruneru#{passion}.png")
		res = twClient.update_with_media("このツイートはねるねるの#{passion}枚目のスクショです(テスト)", rankopic)
		puts res
		rankopic.clear
		flg = false
	end
	if time.min % 20 == 1 then
		flg = true
	end

end