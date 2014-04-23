require 'yaml'
require 'active_record'

CONFIG = YAML.load_file(File.expand_path('../config/config.yml', __FILE__))
['lib', 'lib/model', 'job', 'config'].each do |dir|
  Dir[File.expand_path("../#{dir}", __FILE__) << '/*.rb'].each do |file|
    puts "require #{file}"
    require file
  end
end

ActiveRecord::Base.establish_connection(CONFIG['db']['production'])
ActiveRecord::Base.default_timezone = :local

# UserStream初期化
UserStream.instance

puts "start at #{Time.now}"
