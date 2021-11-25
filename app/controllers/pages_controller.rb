class PagesController < ApplicationController
  def home
    @moods = Mood.all
    @movies = Movie.all
  end
end
