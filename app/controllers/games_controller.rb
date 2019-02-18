require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = random_letters
  end

  def random_letters
    letters = []
    10.times do
      letters << Array('a'..'z').sample.upcase!
    end
    letters
  end

  def score
    @input = params[:input]
    @letters = params[:letters]
    if right_characters(@input, @letters)
      if valid_word(@input)
        @answer = 'Congratulations! You have entered a valid word!'
      else
        @answer = 'You have entered an English word, but not constructed from the letters provided.'
      end
    else
      @answer = 'You seem to have entered an invalid word.'
    end
  end

   def right_characters(input, letters)
    array = input.upcase.split('')
    p array
    a_test = array.all? { |x| array.count(x) <= letters.count(x) }
    @answer = a_test
  end

   def valid_word(input)
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    word_api = open(url).read
    api = JSON.parse(word_api)
    response = api['found']
    response
  end
end
