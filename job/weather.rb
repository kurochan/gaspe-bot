require 'weather_jp'

WeatherJp.customize_to_s do
  word = "#{day}の#{city_name}は#{forecast}♡ "
  word << "最高気温は#{max_temp} " if max_temp
  word << "最低気温は#{min_temp} " if min_temp
  word << "降水確率は#{rain}%" if rain
  word << "だよっ♡"
  word
end

class Weather
  def call(status)
    return unless status.text && status.text.include?('天気')
    tokyo = WeatherJp.get :tokyo
    TwitterClient.instance.update "@#{status.user.screen_name} #{tokyo.today.to_s}", {:in_reply_to_status_id => status.id}
  end
end
