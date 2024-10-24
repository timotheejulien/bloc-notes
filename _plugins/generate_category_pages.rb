module Jekyll
   class CategoryPageGenerator < Generator
     safe true
 
     def generate(site)
       site.categories.each do |category|
         site.pages << CategoryPage.new(site, category[0])
       end
     end
   end
 
   class CategoryPage < Page
     def initialize(site, category)
       @site = site
       @base = site.source
       @dir  = File.join('category', category)
       @name = 'index.html'
 
       self.process(@name)
       self.read_yaml(File.join(@base, '_layouts'), 'category.html')
       self.data['category'] = category
       self.data['title'] = "Posts in category: #{category}"
     end
   end
 end
 