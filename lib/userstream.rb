require 'twitter'
require 'singleton'

class UserStream
  include Singleton

  def initialize
    @on_status_job = []
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

  def add_on_status_job(job)
    @on_status_job.push job
  end

  def on_status(status)
    puts status['text']
    @on_status_job.each do |job|
      job.call status
    end
  end
end
