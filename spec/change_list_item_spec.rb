require_relative "spec_helper"

describe "change list items" do

  let(:filename) { "list_items.md" }

  ["*", "+", "-"].each do |symbol|

    it "should change from simple list (#{symbol}) to check list unchecked" do
      given_content "#{symbol} item" do |source|
        vim.command "call markdown#SwitchStatus()"
        vim.write
        expect(File.read(source)).to eql("#{symbol} [ ] item\n")
      end
    end

    it "should change from check list unchecked (#{symbol}) to check list checked" do
      given_content "#{symbol} [ ] item" do |source|
        vim.command "call markdown#SwitchStatus()"
        vim.write
        expect(File.read(source)).to eql("#{symbol} [x] item\n")
      end
    end

    it "should change from check list checked (#{symbol}) to simple list" do
      given_content "#{symbol} [x] item" do |source|
        vim.command "call markdown#SwitchStatus()"
        vim.write
        expect(File.read(source)).to eql("#{symbol} item\n")
      end
    end

  end
end
