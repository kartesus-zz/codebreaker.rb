class State
  attr_reader :status, :tries

  def initialize(status, tries)
    @status = status
    @tries = tries
  end

  def === other
    return other === self.status if other.is_a? Symbol
  end
end
