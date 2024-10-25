 module Jekyll
   class CategoryPageGenerator < Generator
     safe true
 
     def generate(site)
       site.categories.each do |category|
         site.pages << CategoryPage.new(site, site.source, category[0])
       end
     end
   end
 
   class CategoryPage < Page
     def initialize(site, base, category)
       @site = site
       @base = base
       @dir = '/' # Root directory for each category page
       @name = "#{category}.html" # Each category page is named after the category
 
       self.process(@name)
       self.read_yaml(File.join(@base, '_layouts'), 'category.html')
       self.data['category'] = category
       self.data['title'] = "#{category.capitalize}"
     end
   end
 end