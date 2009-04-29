require 'rubygems'
require 'dspace-ruby'
require 'pp'

opts = Dspace::Config.load('example.config')
pp opts