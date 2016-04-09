require_relative "spec_helper"

describe "autoformatting" do

  let(:filename) { "autoformatting.md" }

  it "should format long item lists" do
    before = <<-EOF.gsub /^    /, ""
    * long long long long long long long long long long long long long long long long long long long long long long long long
    EOF
    expected = <<-EOF.gsub /^    /, ""
    * long long long long long long long long long long long long long long long
      long long long long long long long long long

    EOF
    given_content before do |source|
      vim.write
      vim.command "set textwidth=80"
      vim.normal "gggqq"
      vim.write
      expect(File.read(source)).to eql(expected)
    end
  end
end
