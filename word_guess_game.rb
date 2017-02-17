class ASCII
  @moon = [
    "
       _..._
     .'     `.
    :         :
    :         :
    `.       .'
      `-...-'",
    "
       _..._
     .::'   `.
    :::       :
    :::       :
    `::.     .'
      `':..-'",
    "
       _..._
     .::::  `.
    ::::::    :
    ::::::    :
    `:::::   .'
      `'::.-'",
    "
       _..._
     .::::. `.
    :::::::.  :
    ::::::::  :
    `::::::' .'
      `'::'-'",
    "
       _..._
     .:::::::.
    :::::::::::
    :::::::::::
    `:::::::::'
      `':::''"
  ]

  def self.show_moon(num)
    puts @moon[num]
  end
end

class WordGuess
  attr_accessor :correct_guesses, :wrong_guesses
  attr_reader :word
  
  def initialize
    @word = 'pizza'.split('')
    @correct_guesses = []
    @wrong_guesses = []
  end

  def get_input
    puts 'Type a single letter' # TODO check input  length
    input = gets.chomp
    handle_input(input)
  end

  def handle_input(input)
    if @word.include? input
      @correct_guesses << (input)
    else
      @wrong_guesses << (input)
    end
    show_ascii
  end

  def show_ascii
    num_wrongs = @wrong_guesses.length
    ASCII.show_moon(num_wrongs)
    show_text
  end

  def show_text
    text = '     '
    @word.each do |char|
      if @correct_guesses.include? char
        text += char + ' '
      else
        text += '_ '
      end
    end
    puts text
  end

  def game_over
    if @wrong_guesses.length >= 4
      puts "Sorry, out of guesses"
      return true
    elsif @word.all? { |char| @correct_guesses.include? char }
      puts "Congrats you won!"
      return true
    end
    return false
  end

  def game
    show_ascii
    while !game_over do
      get_input
    end
  end
end

WordGuess.new.game
