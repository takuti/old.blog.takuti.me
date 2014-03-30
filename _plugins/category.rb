module Jekyll
  class CategoryPage < Page
    def initialize(site, base, dir, category)

      @site = site
      @base = base
      @dir = dir.downcase.gsub(" ","-")
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category
      self.data['title'] = category
    end
  end

  class CategoryPageGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'category'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end
end
