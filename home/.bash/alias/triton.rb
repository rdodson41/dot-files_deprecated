#!/usr/bin/env ruby

ARGF.map(&:chomp).each do |profile|
  puts "alias #{profile}-exec='TRITON_PROFILE=#{profile} triton-profile-exec'"
  puts "complete -c #{profile}-exec"
end
