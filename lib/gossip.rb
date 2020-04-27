require 'csv'

class Gossip

  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(row)
    table = CSV.table('db/gossip.csv')
    number_gossip = Gossip.new(table[row.to_i - 1][0], table[row.to_i - 1][1])
    number_gossip
  end


  end
end