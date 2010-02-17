require File.dirname(__FILE__) + '/../../../../test_helper'

class PrefixIssueWithAuthor::Patches::IssuePatchTest < ActiveSupport::TestCase
  context "Issue#subject with no author" do
    should "return the subject" do
      project = Project.generate!
      issue = Issue.generate_for_project!(project, :subject => 'The subject', :author => User.anonymous)

      assert_equal 'The subject', issue.subject
    end
  end

  context "Issue#subject with an author" do
    should "prefix the subject with the author name" do
      author = User.generate_with_protected!(:firstname => 'Bob', :lastname => 'Bobcat')
      project = Project.generate!
      issue = Issue.generate_for_project!(project, :subject => 'The subject', :author => author)

      assert_equal 'Bob Bobcat - The subject', issue.subject
    end
  end
end
