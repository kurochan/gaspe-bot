class PakuTwiJob
  def call
    data = [
      'てすと'
    ]
    TwitterClient.instance.update data[rand data.length]
  end
end
