class PakuTwiJob
  def call
    status = Tweet.where("screen_name = '#{CONFIG['bot']['target']}'").
      where("text not like '%@%'").
      where("text not like '%http%'").sample
    TwitterClient.instance.update status.text
  end
end
