require './lib/game'

RSpec.describe Game do
  it "begins in :game_started state" do
    expect(Game.new.state).to be === :game_started
  end

  it "turns to :player_won when user guesses right" do
    game = Game.new( Code.new [1,2,3,4] )
    game = game << [1,2,3,4]
    expect(game.state).to be === :player_won
  end

  it "ignores tries after player has won" do
    game = Game.new(Code.new [1,2,3,4] )
    game = game << [1,2,3,4]
    game = game << [1,2,3,4]
    expect(game.state.tries.size).to be(1)
  end

  it "turns to :player_lost after the fourth wrong guess" do
    game = Game.new(Code.new([1,2,3,4]), State.new(:something, [{}, {} ,{}]))
    game = game << [2,2,2,2]
    expect(game.state).to be === :player_lost
  end

  it "doesnt change after player has lost" do
    game = Game.new(Code.new, State.new(:player_lost,[]))
    game = game << [1,2,3,4]
    expect(game.state.tries.size).to be(0)
  end

  it "turns to :wrong_guess after the first wrong guess" do
    game = Game.new(Code.new([1,2,3,4]))
    game = game << [2,2,2,2]
    expect(game.state).to be === :wrong_guess
  end
end
