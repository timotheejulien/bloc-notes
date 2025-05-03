POSTS_DIR = "_posts"

Dir.glob("#{POSTS_DIR}/**/*.md").each do |file_path|
  lines = File.readlines(file_path)

  if lines.size > 1
    File.write(file_path, lines[1..].join)
    puts "🗑️ Première ligne supprimée : #{file_path}"
  else
    puts "⚠️ Fichier trop court, ignoré : #{file_path}"
  end
end
