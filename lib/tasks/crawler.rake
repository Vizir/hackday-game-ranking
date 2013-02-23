#encoding: utf-8


begin
  namespace :crawler do
    task :import_teams => :environment  do
      GameRanking::Crawler.import_teams
    end
  end
end

