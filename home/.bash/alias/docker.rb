#!/usr/bin/env ruby

require 'yaml'

YAML.load(ARGF.read).each do |application, services|
  name = application.delete(?-)

  puts "alias #{application}-ps='docker ps --filter name=#{name}'"

  services.each do |service|
    puts "alias #{application}-#{service}-ps='docker ps --filter name=#{name}-#{service}'"
    puts "alias #{application}-#{service}='#{application}-#{service}-ps --quiet | xargs docker'"
    puts "alias #{application}-#{service}-first='#{application}-#{service}-ps --quiet | first | xargs docker'"
    puts "alias #{application}-#{service}-first-exec='docker exec --interactive --tty \"$(#{application}-#{service}-ps --quiet | first)\"'"
  end
end
