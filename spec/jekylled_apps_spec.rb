# Service Manual and Transformation are bundled into this Rails app
# This test ensures that nothing unexpected happens as part of that bundling process

require 'spec_helper'

describe :JekylledApps do
  it "should not contain git merge artifacts" do
    merge_artifacts = Dir['**/*.orig'].select { |f| File.file?(f) }
    merge_artifacts.should be_empty
  end
end
