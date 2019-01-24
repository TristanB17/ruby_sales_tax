class Receipt
  attr_reader :list

  def initialize(filepath)
    @list = File.read(filepath).split("\n")
  end
end
