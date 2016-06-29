RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'mocha/api'
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))
Dir["./test/helpers/*.rb"].each {|file| require file }
require "database_cleaner"

class MiniTest::Spec
  include Mocha::API
  include Rack::Test::Methods
  DatabaseCleaner.strategy = :transaction
  before do
    DatabaseCleaner.start
  end
  after do
    DatabaseCleaner.clean
  end

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app Alittlebit::App
  #   app Alittlebit::App.tap { |a| }
  #   app(Alittlebit::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end
