require "bundler"
require "ostruct"
Bundler.setup(:default)
Bundler.require(:default)

$LOAD_PATH.unshift File.expand_path("../../app", __FILE__)

module Application
  TABLE = OpenStruct.new(width: 5, height: 5)
end

require "position_validator"
require "position"
require "facing"
require "table"
require "robot"
require "commander"

