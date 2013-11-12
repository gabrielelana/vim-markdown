require "vimrunner"
require "vimrunner/rspec"

Vimrunner::RSpec.configure do |config|
  plugin_path = File.expand_path("..", File.dirname(__FILE__))

  config.reuse_server = false
  config.start_vim do
    vim = Vimrunner.start
    vim.add_plugin(plugin_path, "syntax/markdown.vim")
    vim.add_plugin(plugin_path, "ftdetect/markdown.vim")
    vim
  end
end
