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

  #--------- Validations
  validates_presence_of :mp3

end
