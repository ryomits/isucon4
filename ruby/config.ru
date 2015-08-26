require_relative './app.rb'
require 'stackprof'
Dir.mkdir('/tmp/stackprof') unless File.exist?('/tmp/stackprof')
use StackProf::Middleware, enabled: true, mode: :wall, interval: 500, save_every: 5, path: '/tmp/stackprof'

run Isucon::App
