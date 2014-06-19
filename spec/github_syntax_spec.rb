require "nokogiri"
require_relative "spec_helper"

features = [
  "jekyll",
  "lists",
  "lists_with_tasks",
  "lists_with_lists",
  "lists_with_tables",
  "lists_with_codeblocks",
  "lists_with_fenced_codeblocks",
  "lists_with_anchored_elements",
  "autolinks",
  "blockquotes",
  "blockquotes_nested",
  "combined_emphasis",
  "contained_emphasis",
  "strikethrough",
  "headers_atx",
  "headers_setext",
  "strong_emphasis",
  "weak_emphasis",
  "inline_html",
  "inline_links",
  "inline_references",
  "codeblocks",
  "tables"
]

describe "github markdown syntax" do
  let(:filename) {"syntax.html"}

  features.each do |feature|
    source = File.expand_path("./features/#{feature}.md", File.dirname(__FILE__))
    master = source + ".html"
    it "should support #{feature.gsub("_", " ")}" do
      vim.command "let g:markdown_flavor=github"
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
