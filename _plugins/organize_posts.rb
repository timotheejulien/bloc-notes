#!/usr/bin/env ruby
require 'fileutils'

# Spécifie le dossier des posts
posts_dir = "_posts"

# Trouve tous les fichiers markdown dans le dossier _posts
Dir.glob("#{posts_dir}/*.md").each do |file|
  # Récupère le nom du fichier et analyse la date à partir du nom du fichier (YYYY-MM-DD-title.md)
  filename = File.basename(file)
  if filename =~ /^(\d{4})-(\d{2})-(\d{2})-(.*)\.md$/
    year = $1
    month = $2
    day = $3
    title = $4

    # Crée le chemin du nouveau dossier (année/mois)
    new_dir = File.join(posts_dir, year, month)
    FileUtils.mkdir_p(new_dir) unless File.directory?(new_dir)

    # Déplace le fichier vers le nouveau dossier
    new_file_path = File.join(new_dir, filename)
    FileUtils.mv(file, new_file_path)

    puts "Moved #{filename} to #{new_dir}/"
  else
    puts "Filename format not recognized for #{filename}, skipping."
  end
end
