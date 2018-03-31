desc 'Use rackup and start server using host 0.0.0.0 on port 4567'
task :default do

  host = '0.0.0.0'
  port = 4567

  puts "About to boot mock server http://#{host}:#{port}"
  puts "CTRL + C to exit"

  `rackup config.ru -o '#{host}' -p '#{port}'`
end
