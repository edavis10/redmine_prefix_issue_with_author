require 'redmine'

require 'dispatcher'

Dispatcher.to_prepare :redmine_prefix_issue_with_author do
  require_dependency 'issue'
  Issue.send(:include, PrefixIssueWithAuthor::Patches::IssuePatch)
end

Redmine::Plugin.register :redmine_prefix_issue_with_author do
  name 'Redmine Prefix Issue With Author plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
end
