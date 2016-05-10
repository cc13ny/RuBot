#!/usr/bin/env ruby
# A simple script for namespacing configs in CircleCI

ENV['SERVICE'] = ENV['CIRCLE_BRANCH']
ENV['SERVICE_NAME'] = ENV['CIRCLE_BRANCH']

ENV.each do |k,v| 
  if k.start_with?(ENV['CIRCLE_BRANCH'].upcase)
    _, key = k.split('_')
    ENV[key] = v
    Process.spawn(ENV, 'make deploy')
  end
end
