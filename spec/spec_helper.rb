# encoding: utf-8

require 'bundler'
Bundler.setup

if RUBY_ENGINE == 'rbx'
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'rom-filesystem'

root = Pathname(__FILE__).dirname
TMP_PATH = root.join('../tmp')
TMP_TEST_DIR = TMP_PATH.join('test')

Dir[root.join('shared/*.rb').to_s].each { |f| require f }

RSpec.configure do |config|
  config.before do
    FileUtils.rm_r(TMP_TEST_DIR) if File.exist?(TMP_TEST_DIR)
    FileUtils.mkdir_p(TMP_TEST_DIR)

    @constants = Object.constants
  end

  config.after do
    added_constants = Object.constants - @constants
    added_constants.each { |name| Object.send(:remove_const, name) }
  end
end
