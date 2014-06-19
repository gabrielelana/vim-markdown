require "tmpdir"

module Support
  module Vim
    def source
      File.join(Dir.tmpdir, filename)
    end

    def given_content(string)
      vim.edit source
      vim.insert string
      yield source
    end
  end
end

