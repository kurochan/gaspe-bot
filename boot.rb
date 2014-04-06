['lib', 'job', 'config'].each do |dir|
  Dir[File.expand_path("../#{dir}", __FILE__) << '/*.rb'].each do |file|
    puts "require #{file}"
    require file
  end
end
UserStreamJob.new
puts "start at #{Time.now}"
