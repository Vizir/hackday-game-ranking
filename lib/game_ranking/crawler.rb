require 'open-uri'

module GameRanking
  class Crawler
    def self.import_teams
      countries = get_countries
      countries.each do |country|
        leagues = get_leagues(country)
        leagues.each do |league|
          save_teams(league)
        end
      end

    end

  private

    def self.get_countries
      countries = []
      xml = Nokogiri::XML(open("http://fifaapi.com/countries/all.xml"))
      xml.xpath("//country").each do |country|
        countries << country.at("id").text
      end
      countries
    end

    def self.get_leagues(country_id)
      leagues = []
      xml = Nokogiri::XML(open("http://fifaapi.com/country/#{country_id}.xml"))
      xml.xpath("//league").each do |league|
        leagues << league.at("id").text
      end
      leagues
    end

    def self.save_teams(league_id)
      xml = Nokogiri::XML(open("http://fifaapi.com/league/#{league_id}.xml"))
      xml.xpath("//club").each do |club|
        team = Team.new
        attributes_names = ["name", "league_id", "logo", "attack", "middle", "defense", "score"]
        i = 0
        %w[name league_id logo att mid def score].each do |n|
          tag = club.at(n)
          team[attributes_names[i]] = tag.text if !tag.nil?
          i += 1
        end
        team.save
      end
    end


  end
end