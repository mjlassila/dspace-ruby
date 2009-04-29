require 'lib/dspace/config'
require 'pp'

opts = Dspace::Config.load('example.config')
pp opts