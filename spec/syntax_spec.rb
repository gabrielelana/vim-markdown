require "rspec"
require "nokogiri"
require_relative "spec_helper"

features = [
  "lists",
  "autolinks",
  "blockquotes",
  "blockquotes_nested",
  "combined_emphasis",
  "contained_emphasis",
  "strikethrough",
  "headers_atx",
  "headers_setext",
  "strong_emphasis",
  "weak_emphasis"
]

describe "markdown syntax" do

  let(:filename) {"syntax.html"}

  features.each do |feature|
    source = File.expand_path("./features/#{feature}.md", File.dirname(__FILE__))
    master = source + ".html"
    it "should support #{feature.gsub("_", " ")}" do
      vim.edit source
      vim.command "set nospell"
      vim.command "TOhtml | w #{filename}"
      if not File.exists?(master) or ENV["GENERATE_GOLDEN_MASTER"]
        vim.command "w #{master}"
      end
      master_syntax = Nokogiri::HTML(IO.read(master))
      source_syntax = Nokogiri::HTML(IO.read(filename))
      expect(master_syntax.css("#vimCodeElement").first.to_s).to eq(source_syntax.css("#vimCodeElement").first.to_s)
    end
  end
end
