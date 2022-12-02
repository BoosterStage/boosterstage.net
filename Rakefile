task default: %w[test]

task :test do
  puts "\n 🔨  Building project\n"
  try "bundle exec middleman build"
end

def try(command)
  system command
  if $? != 0 then
    raise "Command: `#{command}` exited with code #{$?.exitstatus}"
  end
end

