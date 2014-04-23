class KeywordFavJob
  def call(status)
    return unless status.text
    data = [
      '卓同',
      'タクドウ',
      'たくどう',
      'がすぺ',
      'ガスペ',
      '清楚',
      'せいそ',
      '詰み',
      '詰ん',
      'クソネミ',
      'ｸｿﾈﾐ',
    ]
    data.each do |str|
      if status.text.include? str
        puts "Keyword favorited"
        TwitterClient.instance.favorite status.id
        break
      end
    end
  end
end
