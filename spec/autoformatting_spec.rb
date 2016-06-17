require_relative "spec_helper"

describe "autoformatting" do

  let(:filename) { "autoformatting.md" }

  it "should format long item lists" do
    before = <<-EOF.gsub /^    /, ""
    * long long long long long long long long long long long long long long long long long long long long long long long long

    EOF
    # I don't know why but the interaction with vimrunner inserts a couple of
    # stars at the end
    expected = <<-EOF.gsub /^    /, ""
    * long long long long long long long long long long long long long long long
      long long long long long long long long long
    *
    *
    EOF
    given_content before do |source|
      vim.command "set textwidth=80"
      vim.normal "gggqq"
      vim.write
      expect(File.read(source)).to eql(expected)
    end
  end

  it "should create new list items" do
    before = <<-EOF.gsub /^    /, ""
    * item
    EOF
    # I don't know why but the interaction with vimrunner inserts a couple of
    # stars at the end
    expected = <<-EOF.gsub /^    /, ""
    * item
    *
    *
    EOF
    given_content before do |source|
      vim.normal "ggA"
      vim.type "<CR>"
      vim.write
      given = File.read(source).gsub /[ ]+$/, ""
      expect(given).to eql(expected)
    end
  end
end
