class Post

  attr_accessor :title, :body, :author, :image, :created_at, :tags, :id

  def initialize(options)
    self.title = options[:title]
    self.body = options[:body]
    self.author = options[:author]
    self.image = options[:image]
    self.created_at = options[:created_at]
    self.tags = options[:tags]
    self.id = options[:id]
  end

  def self.all
    @posts ||= 10.times.map do |id|
      Post.new(
        title: Faker::Book.title,
        body: Faker::Hipster.paragraphs(6).join("\n\n"),
        author: Faker::StarWars.character,
        image: Faker::Placeholdit.image("880x400"),
        created_at: rand(1..6).months.ago,
        tags: Faker::Hipster.words(4),
        id: id + 1
      )
    end
  end

end
