require 'active_record'

['lib', 'lib/model', 'job', 'config'].each do |dir|
  Dir[File.expand_path("../#{dir}", __FILE__) << '/*.rb'].each do |file|
    puts "require #{file}"
    require file
  end
end

CONFIG = YAML.load_file(File.expand_path('../config/config.yml', __FILE__))
ActiveRecord::Base.establish_connection(CONFIG['db']['production'])
ActiveRecord::Base.default_timezone = :local

UserStreamJob.new

puts "start at #{Time.now}"
