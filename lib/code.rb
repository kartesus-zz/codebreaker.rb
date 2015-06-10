class Code
  attr_reader :secret

  def initialize(secret = (1..6).to_a.shuffle.take(4))
    raise ArgumentError, 'secret must be an Array' unless secret.is_a? Array
    @secret = secret
  end

  def check(secret)
    raise ArgumentError, 'secret must be an Array' unless secret.is_a? Array
    secret.each_with_index.map do |a, i|
      if @secret[i] === a then :+
      elsif @secret.include? a then :-
      else :x
      end
    end
  end
end
