require "rspec"
require "vimrunner"
require "vimrunner/rspec"

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end

Vimrunner::RSpec.configure do |config|
  plugin_path = File.expand_path("..", File.dirname(__FILE__))

  config.reuse_server = false
  config.start_vim do
    vim = Vimrunner.start
    vim.prepend_runtimepath(plugin_path)
    vim.command "let g:markdown_include_jekyll_support = 1"
    vim.command "set nospell"
    vim.command "set nofoldenable"
    vim
  end
end

RSpec.configure do |config|
  require_relative "support/vim"
  config.include Support::Vim
  config.after(:each) do
    if File.exists? source
      File.delete source
    end
  end
end

RSpec::Matchers.define :have_content do |expected|
  match do |source|
    File.read(source).match(expected)
  end
  failure_message_for_should do |source|
    "expected file '#{source}' to match '#{expected}' but contains:\n'#{File.read(source)}'"
  end
end
