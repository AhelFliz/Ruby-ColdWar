class FileHandler
  def self.red_file(path = 'ColdWar/data/rules.txt')
    raise 'File doesnt exist' unless File.exist?(path)

    File.read(path)
  end
end
