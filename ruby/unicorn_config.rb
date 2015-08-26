worker_processes 4
listen '/tmp/unicorn.sock'
preload_app true
stderr_path File.expand_path('log/unicorn.log', File.dirname(__FILE__))
stdout_path File.expand_path('log/unicorn.log', File.dirname(__FILE__))
