require 'redmine'

require 'dispatcher'

Dispatcher.to_prepare :redmine_prefix_issue_with_author do
  require_dependency 'issue'
  Issue.send(:include, PrefixIssueWithAuthor::Patches::IssuePatch)
end

Redmine::Plugin.register :redmine_prefix_issue_with_author do
  name 'Prefix Issue with Author'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description "Redmine plugin that will prefix the Issue subject with the author's name."
  
  version '0.1.0'

  requires_redmine :version_or_higher => '0.8.7'
end
