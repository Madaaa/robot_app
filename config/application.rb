require "bundler"
Bundler.setup(:default)
Bundler.require(:default)

$LOAD_PATH.unshift File.expand_path("../../app", __FILE__)

require "position_validator"
require "position"
require "robot"
