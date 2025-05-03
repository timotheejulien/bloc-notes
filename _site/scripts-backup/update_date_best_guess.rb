require 'yaml'
require 'time'

POSTS_DIR = "_posts"

def macos_creation_date(path)
  raw = `mdls -name kMDItemFSCreationDate -raw "#{path}"`.strip
  return nil if raw.empty? || raw == "(null)"
  Time.parse(raw).localtime.strftime("%Y-%m-%d %H:%M:%S %z")
rescue
  nil
end

def git_creation_date(path)
  raw = `git log --diff-filter=A --follow --format=%aI -- "#{path}" | tail -1`.strip
  return nil if raw.empty?
  Time.parse(raw).localtime.strftime("%Y-%m-%d %H:%M:%S %z")
rescue
  nil
end

Dir.glob("#{POSTS_DIR}/**/*.md").each do |file_path|
  date = macos_creation_date(file_path) ||
         git_creation_date(file_path) ||
         File.mtime(file_path).localtime.strftime("%Y-%m-%d %H:%M:%S %z")

  lines = File.readlines(file_path)

  if lines[0].strip == "---"
    yaml_end_index = lines[1..].find_index { |l| l.strip == "---" }
    if yaml_end_index
      yaml_end_index += 1
      front_matter_raw = lines[1...yaml_end_index]
      content_lines = lines[(yaml_end_index + 1)..]

      front_matter = YAML.safe_load(front_matter_raw.join, aliases: true)
      front_matter["date"] = date

      new_front_matter = front_matter.to_yaml.lines.map { |l| l.gsub("\r\n", "\n") }
      final_lines = ["---\n"] + new_front_matter + ["---\n"] + content_lines

      File.write(file_path, final_lines.join)
      puts "✅ #{file_path} → #{date}"
    else
      puts "⚠️ Front matter incomplet dans : #{file_path}"
    end
  else
    puts "⚠️ Pas de front matter YAML dans : #{file_path}"
  end
end
``
