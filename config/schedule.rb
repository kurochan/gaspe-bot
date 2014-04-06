module Clockwork
  # every(1.day, TestJob.new, :at => '**:00')
  # every 1.seconds, TestJob.new, :thread => true
  every 2.hours, PakuTwiJob.new

  # よるほー
  every 1.day, YoruhoJob.new, :at => '**:00'
end
