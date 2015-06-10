require_relative './code'
require_relative './state'

class Game
  attr_reader :state, :last_try

  def initialize(code = Code.new, state = State.new(:game_started, []))
    @code = code
    @state = state
    @last_try = @state.tries.last
  end

  def << secret
    return self if @state === :player_won
    return self if @state === :player_lost

    tries = @state.tries.push Try.new(secret, @code.check(secret))

    if @code.secret === secret
      Game.new(@code, State.new(:player_won, tries))
    elsif tries.size >= 4
      Game.new(@code, State.new(:player_lost, tries))
    else
      Game.new(@code, State.new(:wrong_guess, tries))
    end
  end
end

class Try < Struct.new(:guess, :feedback)
end
