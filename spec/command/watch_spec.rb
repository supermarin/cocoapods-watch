require File.expand_path('../../spec_helper', __FILE__)

# The CocoaPods namespace
#
module Pod

  class Command < CLAide::Command

    def sleep
      "CAFEINEEEE NO SLEEP"
    end

    describe Watch do

      #class ShellTask
        #def self.run(args)
          #@@command = args
        #end
      #end

      before do
        @base_dir = Dir.pwd
        @command = Command.parse(%w(watch))
        @listen_event = @command.listen_action
      end

      it "registers itself as a command" do
        @command.should.be.instance_of Command::Watch
      end

      it 'ignores everything except objc files' do
        @command.ignored_paths.should == [
          /.git/,
          /.xc(odeproj|workspace|userdata|scheme|config)/,
          /.lock$/,
          /\.txt$/,
          /\.log$/
        ]
      end

      it 'listens to file changes' do
        mock_listener = stub
        Listen.expects(:to)
          .with(Dir.pwd, :ignore => @command.ignored_paths)
          .returns(mock_listener)
        mock_listener.expects(:start)
        @command.run
      end

      it 'reinstalls pods once the podfile is changed' do
        ShellTask.expects(:run).with('pod install')
        @listen_event.call(['Podfile'], [], [])
      end

      #it 'watches for additions/deletions in local pods' do

      #end

    end
  end
end

