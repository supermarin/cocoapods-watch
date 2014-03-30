require File.expand_path('../../spec_helper', __FILE__)

# The CocoaPods namespace
#
module Pod
  describe Command::Watch do

    #-------------------------------------------------------------------------#

    describe "Try" do
      it "registers it self" do
        Command.parse(%w(watch)).should.be.instance_of Command::Watch
      end
    end

  end
end

