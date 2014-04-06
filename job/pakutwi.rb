class PakuTwiJob
  def call
    3.times do
      status = Tweet.where("screen_name = '#{CONFIG['bot']['target']}'").
        where("text not like '%@%'").
        where("text not like '%http%'").sample

      next if ng? status.text
      TwitterClient.instance.update status.text
      break
    end
  end

  def ng?(str)
    ret = false
    CONFIG['bot']['ng-word'].each do |word|
      ret = str.include?(word)
      break if ret
    end
    return ret
  end
end
