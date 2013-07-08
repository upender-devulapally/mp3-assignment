class Song
  include Mongoid::Document
  include Mongoid::Timestamps

  #--------  Fields
  field :title
  field :artist
  field :album
  field :tracknum

  #--------- Attributes & Variables

  #--------- Relations
  mount_uploader :mp3, Mp3Uploader

  #--------- Scopes
  default_scope desc(:created_at)

  #--------- Validations
  validates_presence_of :mp3

  def self.search(query)
    if query.blank?
      scoped
    else query
    reg_term = /.*#{query}.*/i
    any_of({title: reg_term},{album: reg_term},{artist: reg_term})
    end
  end

end
