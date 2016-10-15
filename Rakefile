require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'anpan'

RSpec::Core::RakeTask.new(:spec)

task default: :output

task :output do
  DEST_DIR = 'dist'
  CONFS = {
    'anpan.txt': Anpan::An::CONF,
    'dvorakjp.txt': Anpan::An::DVORAKJP,
    'google_japanese_input.txt': Anpan::An::GOOGLE_JAPANESE,
  }.freeze
  Dir.mkdir DEST_DIR
  CONFS.each do |filename, conf|
    path = "#{DEST_DIR}/#{filename}"
    File.open(path, 'w') do |file|
      file.write Anpan.new(conf).render
    end
  end
end

task :render do
  puts Anpan.new.render
end
