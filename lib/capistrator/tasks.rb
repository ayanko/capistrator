Capistrano::Configuration.instance.load do
  Dir[File.join(File.dirname(__FILE__), 'tasks', '*.rb')].each { |f| load f }
end
