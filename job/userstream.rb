class UserStreamJob
  def initialize
    Thread.new do
      crash_count = 0
      loop do
        t = Thread.new do
          puts 'start user stream'
          client = TwitterStreamClient.instance
          client.user do |object|
            case object
            when Twitter::Tweet
              on_status object
            end
          end
        end
        begin
          t.join
        rescue => e
          crash_count += 1
          puts e.class
          puts e.message
          puts e.backtrace
          puts "[UserStream] ERROR retry... (#{crash_count} times)"
        end
        sleep 5
      end
    end
  end

  def on_status(status)
    puts status['text']
  end
end
