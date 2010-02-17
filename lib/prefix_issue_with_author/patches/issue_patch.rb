module PrefixIssueWithAuthor
  module Patches
    module IssuePatch
      def self.included(base)
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods

        def subject
          if author && !author.anonymous?
            orig_subject = super
            return "#{author} - #{orig_subject}"
          else
            super
          end
        end
        
      end
    end
  end
end
