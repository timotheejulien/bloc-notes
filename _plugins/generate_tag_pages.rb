# _plugins/generate_tag_pages.rb

module Jekyll
   class TagPageGenerator < Generator
     safe true
 
     def generate(site)
       # Si le layout "tag" existe, on procède à la création des pages
       if site.layouts.key? 'tag'
         # Pour chaque tag trouvé dans les articles
         site.tags.keys.each do |tag|
           # Crée une page pour chaque tag
           site.pages << TagPage.new(site, site.source, tag)
         end
       end
     end
   end
 
   # Classe qui crée une page pour chaque tag
   class TagPage < Page
     def initialize(site, base, tag)
       @site = site
       @base = base
       @dir = File.join('tag', tag)  # Dossier où la page sera générée
       @name = 'index.html'          # Nom du fichier
 
       self.process(@name)
       self.read_yaml(File.join(base, '_layouts'), 'tag.html')  # Utilise le layout 'tag.html'
       self.data['tag'] = tag                                    # Passe la variable 'tag' au layout
       self.data['title'] = "Notes avec le tag #{tag}"        # Titre de la page
     end
   end
 end
 