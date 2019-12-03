class Scraper

    def get_page
       Watir::Browser.new :chrome, headless: true, options: {options: {detach: true}}
    end

    def get_search_results(search)
        this = get_page
        this.goto("http://google.com")
        this.input(name: 'q').send_keys(search, :return)

        results = {:titles => [], :links => [], :descriptions => []}

        next_page = 0
        while next_page < 5
            this.elements(css: "div.srg div.rc").each do |ele|
                results[:titles] << ele.element(css: "h3.LC20lb").text
                results[:links] << ele.element(css: "div.r a:nth-of-type(1)").attribute('href')
                results[:descriptions] << ele.element(css: "div.s span.st").text
            end
            this.element(css: "table tbody tr td a#pnnext").click
            next_page += 1
        end
        results
    end

end