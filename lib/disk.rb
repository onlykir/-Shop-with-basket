class Disk < Product
  attr_accessor :title, :artist, :genre, :year

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp:true)

    self.new(
      title: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "Песня «#{@title}», #{@genre}, #{@year}, исполнитель — #{@artist}, #{super}"
  end

  def info
    "«#{@title}»  -  #{@artist} (#{@year})"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
