require 'aruba/cucumber'
require 'pry'
require 'cucumber/en_snippet'

require 'rspec/expectations'

RSpec::Matchers.define :include do |expected|
  match do |actual|
    actual.include? expected
  end

  failure_message_for_should do |actual|
    <<-EOM.gsub(/^ *\|/, '')
      |expected:
      |#{expected.gsub(/^/,'  ')}
      |got:
      |#{actual.gsub(/^/,'  ')}
    EOM
  end
end
