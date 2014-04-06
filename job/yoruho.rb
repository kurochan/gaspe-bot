class YoruhoJob
  def call
    data = [
      '明日こそ清楚の底力見せる時だ',
      'よるほー',
      'くっそ12時なう',
      '夜です',
    ]
    TwitterClient.instance.update data[rand data.length]
  end
end
