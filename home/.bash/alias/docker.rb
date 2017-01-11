#!/usr/bin/env ruby

require 'yaml'

FILE = File.join(ENV['HOME'], '.docker', 'services.yml')

YAML.load_file(FILE).each do |application, services|
  name = application.delete(?-)

  puts <<~EOF
    alias #{application}-ps='docker ps --filter name=#{name}'
  EOF

  services.each do |service|
    puts <<~EOF
      alias #{application}-#{service}-ps='docker ps --filter name=#{name}-#{service}'
      alias #{application}-#{service}='#{application}-#{service}-ps --quiet | xargs docker'
      alias #{application}-#{service}-inspect-ip-address='#{application}-#{service} inspect --format {{.NetworkSettings.IPAddress}}'
      alias #{application}-#{service}-inspect-ports='#{application}-#{service} inspect --format {{.NetworkSettings.Ports}}'
      alias #{application}-#{service}-first='#{application}-#{service}-ps --quiet | first | xargs docker'
      alias #{application}-#{service}-first-exec='docker exec --interactive --tty "$(#{application}-#{service}-ps --quiet | first)"'
    EOF
  end
end if File.exists?(FILE)
