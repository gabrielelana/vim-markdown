require_relative "spec_helper"

describe "change header level" do

  let(:filename) { "headers.md" }

  it "should increase header of level 1 to level 2" do
    given_content "# Header" do |source|
      vim.command "call markdown#SwitchStatus()"
      vim.write
      expect(source).to have_content("## Header")
    end
  end

  it "should increase header of level 3 to level 4" do
    given_content "### Header" do |source|
      vim.command "call markdown#SwitchStatus()"
      vim.write
      expect(source).to have_content("#### Header")
    end
  end

  it "should go back to level 1 after level 6" do
    given_content "###### Header" do |source|
      vim.command "call markdown#SwitchStatus()"
      vim.write
      expect(source).to have_content("# Header")
    end
  end

end
