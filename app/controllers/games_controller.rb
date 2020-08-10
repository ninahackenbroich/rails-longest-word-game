class GamesController < ApplicationController
  def new
    @letters = ["a".."z"].sample(random: SecureRandom)
  end

  def score
  end
end
