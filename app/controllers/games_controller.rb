require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { |i| @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word].capitalize
    @grid = params[:letters]
    if  !english(@word) && !included?(@word, @grid)
      @score = @word.length.to_i
    else
      @score = "Try again"
    end
  end

  def english(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_dictionary = open(url).read
    word = JSON.parse(word_dictionary)
    @english = word[:found]
  end


  def included?(word, letters)
    @grid = word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
