require 'time'
require 'yaml'

POSTS_DIR = "_posts"

Dir.glob("#{POSTS_DIR}/**/*.md").each do |file_path|
  mtime = File.mtime(file_path).localtime
  lines = File.readlines(file_path)

  if lines[0].strip == "---"
    yaml_end = lines[1..].find_index { |l| l.strip == "---" }
    if yaml_end
      yaml_end += 1
      front_matter = YAML.safe_load(lines[0..yaml_end].join, aliases: true)

      # Mise à jour de la date avec heure exacte
      front_matter["date"] = mtime.strftime("%Y-%m-%d %H:%M:%S %z")

      # Réécriture du fichier avec la date mise à jour
      new_content = ["---\n", front_matter.to_yaml, "---\n", *lines[(yaml_end + 1)..]]
      File.write(file_path, new_content.join)

      puts "✅ Mis à jour : #{file_path} → #{front_matter['date']}"
    else
      puts "⚠️ Front matter mal formé dans : #{file_path}"
    end
  else
    puts "⚠️ Aucun front matter trouvé dans : #{file_path}"
  end
end
