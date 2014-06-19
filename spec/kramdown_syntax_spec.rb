require "nokogiri"
require_relative "spec_helper"

features = [
  "kramdown/headers_with_id"
]

describe "kramdown markdown syntax" do
  let(:filename) {"syntax.html"}

  features.each do |feature|
    source = File.expand_path("./features/#{feature}.md", File.dirname(__FILE__))
    master = source + ".html"
    it "should support #{feature.split(/\//).last.gsub("_", " ")}" do
      vim.command "let g:markdown_flavor='kramdown'"
      vim.edit source
      vim.command "TOhtml | w #{filename}"
      if not File.exists?(master) or ENV["GENERATE_GOLDEN_MASTER"]
        vim.command "w #{master}"
      end
      master_syntax = Nokogiri::HTML(IO.read(master))
      source_syntax = Nokogiri::HTML(IO.read(filename))
      expect(source_syntax.css("#vimCodeElement").first.to_s).to eq(master_syntax.css("#vimCodeElement").first.to_s)
    end
  end
end
