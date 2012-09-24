require 'spec_helper'

describe Mousetrap::Generators::InstallGenerator do
  context "with mousetrap:install" do
    it "should generate keybindings.js.coffee file" do
      subject.should generate("app/assets/javascripts/keybindings.js.coffee") { |content|
        content.should =~ /Mousetrap\.bind/
      }
    end

    it "should inject require mousetrap into application.js" do
      subject.should generate("app/assets/javascripts/application.js") { |content|
        content.should =~ /\/\/= require mousetrap\n/
      }
    end

    it "should inject require mousetrap into application.css" do
      subject.should generate("app/assets/stylesheets/application.css") { |content|
        content.should =~ /\s\*= require mousetrap\n/
      }
    end
  end
end
