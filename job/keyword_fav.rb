class KeywordFavJob
  def call(status)
    return unless status.text
    data = [
      'がすぺ', 'ガスペ', '清楚', 'せいそ',
      'ｸｿﾈﾐ', 'くそねみ', 'ラブライブ',
      'スクフェス', 'にっこにっこにー', 'じぇい',
      'ジェイ', 'サイゼ', 'ぱんだ', 'パンダ',
      'ばし', 'くろ'
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
