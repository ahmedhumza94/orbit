require 'date'
require 'fileutils'
require 'time'
require 'active_support/all'

class Media
  def self.save(path, name, data)
    Time.zone = 'Eastern Time (US & Canada)'
    t = Time.zone.now
    date = DateTime.parse(t.to_s)
    ymd_structure = date.strftime('%Y/%m/%d')
    dir_structure = File.join(path, 'content/images', ymd_structure)
    FileUtils.mkpath(dir_structure) unless File.exist?(dir_structure)
    file_path = File.join(dir_structure, name)

    File.open(file_path, 'w') do |file|
      file.write(data)
    end

    '/images/' + ymd_structure + '/' + name
  end
end
