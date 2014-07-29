# Service Manual and Transformation are bundled into this Rails app
# This test ensures that nothing unexpected happens as part of that bundling process

require 'spec_helper'

describe :JekylledApps do
  it "should not contain git merge artifacts" do
    merge_artifacts = Dir['**/*.orig'].select { |f| File.file?(f) }
    expect(merge_artifacts).to be_empty, merge_artifacts
  end
end
