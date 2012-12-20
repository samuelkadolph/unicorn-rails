class Readme < String
  attr_reader :path

  def initialize(path)
    @path = path
    super(File.read(self.path))
  end

  def summary
    if self =~ /^# (?:\S+)\s+(.+?)\s{2,}/m
      scrub $1
    else
      raise "could not find summary in #{path}"
    end
  end

  def description
    if self =~ /^## Description\s+(.+?)\s{2,}/m
      scrub $1
    else
      raise "could not find description in #{path}"
    end
  end

  private
    def scrub(string)
      string.delete("\\`").gsub(/\[([^\]]+)\]\([^)]*\)/, "\\1").tr("\n", " ").to_s
    end
end

def readme(path = File.expand_path("./README.md"))
  (@readmes ||= {})[path] ||= Readme.new(path)
end
