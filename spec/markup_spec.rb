# Service Manual and Transformation are bundled into this Rails app
# This test ensures that nothing unexpected happens as part of that bundling process

require 'spec_helper'

describe :erb do
  it "should not contain markdown artifacts" do
    files_with_markdown = Dir['app/**/*.erb'].map { |f|
      [f, (File.read(f) =~ /\[[^\]]+\]\([^\)]+\)/)]
    }.select { |_, position|
      !position.nil?
    }
    expect(files_with_markdown).to be_empty, files_with_markdown
  end
end
