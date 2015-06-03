require 'wikipedia'

class GamesController < ApplicationController
  def index
    session[:movie_title] = nil
    session[:cast_members] = nil
    session[:actor_images] = nil
    if params[:query]
      results = Imdb::Search.new(params[:query])
      movie = results.movies.first
      session[:movie_title] = movie.title
      movie.cast_members
      session[:cast_members] = []
      session[:actor_images] = []
      image_counter = 0
      while image_counter < 5
        movie.cast_members.each do |cast_member|
          if Wikipedia.find(cast_member).image_urls.first != nil
            session[:cast_members] << cast_member
            session[:actor_images] << Wikipedia.find(cast_member).image_urls.first
            image_counter += 1
          end
          session[:cast_members]
          session[:actor_images]
          break if image_counter == 5
        end
      end
    end
  end
end
