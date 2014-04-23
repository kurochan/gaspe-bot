module Clockwork
  # botのオーナーアカウント情報を収集
  every 3.hours, GetOwnerJob.new

  # 本垢の過去のツイートをパクる
  every 2.hours, PakuTwiJob.new

  # よるほー
  every 1.day, YoruhoJob.new, :at => '00:00'
  # every 1.seconds, TestJob.new, :thread => true
end
