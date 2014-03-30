require 'listen'

module Pod
  class Command
    class Watch < Command

      self.summary = 'Watches Podfile for changes and runs `pod install`'

      def run
        listener = Listen.to(Dir.pwd, :ignore => ignored_paths, &listen_action)
        listener.start
        sleep
      end

      def ignored_paths
        [/.git/,
         /.xc(odeproj|workspace|userdata|scheme|config)/,
         /.lock$/,
         /\.txt$/,
         /\.log$/]
      end

      def listen_action
        lambda do |modified, added, removed|
          if modified.first =~ /Podfile$/
            install_pods
          end
        end
      end

      private

      def install_pods
        ShellTask.run('pod install')
      end

    end

    class ShellTask
      def self.run(args)
        puts args
        fork { exec args }
      end
    end

  end
end

