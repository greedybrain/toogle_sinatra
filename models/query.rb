class Query

    @@all = []

    attr_accessor :title, :link, :description

    def initialize(title=nil, link=nil, description=nil)
        @title = title
        @link = link 
        @description = description
        @@all << self
    end

    def self.create(search)
        data = Scraper.new
        queried_data = data.get_search_results(search)
        i = 0
        while i < queried_data[:titles].length
            this_title = queried_data[:titles][i]
            this_link = queried_data[:links][i]
            this_desc = queried_data[:descriptions][i]
            self.new(this_title, this_link, this_desc)
            
            i += 1
        end
    end

    def self.all 
        @@all
    end

end