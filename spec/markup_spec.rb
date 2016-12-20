# Transformation is bundled into this Rails app
# This test ensures that nothing unexpected happens as part of that bundling process

require 'spec_helper'

describe :erb do
  it "should not contain markdown artifacts" do
    files_with_markdown = Dir['app/**/*.erb'].map { |f|
      s = File.read(f)
      pos = (s =~ /\[[^\]]+\]\([^\)]+\)/)
      if !pos.nil?
        # pos is string length. Try to convert that into a file offset
        pos = s.slice(0, pos).bytesize
      end
      [f, pos ]
    }.select { |_, position|
      !position.nil?
    }.map { |filename, position|
      res = filename
      line = 1
      col = 0

      File.open(filename) do |f|
        (0..position).each do |i|
          b = f.getbyte

          if b == 0x0A # newline
            line += 1
            col = 1
          else
            # is this start byte of a UTF-8 codepoint?
            col += 1 if ((b & 0xC0) != 0x80)
          end
        end

        # location is vague since position isn't a file offset
        res += " around line #{line}, column #{col}"
      end

      res
    }
    expect(files_with_markdown).to be_empty
  end
end
