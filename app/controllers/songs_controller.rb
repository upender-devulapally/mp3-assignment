class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  before_filter :find_song ,except: [:create,:index,:new]
  before_filter :get_mp3_tag_info,only: [:create]
  def index
    @songs = Song.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit

  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  protected
  def find_song
    @song = Song.find(params[:id])
  end

  def get_mp3_tag_info
    return unless params[:song]  and params[:song][:mp3]
    file = params[:song][:mp3]
    #ext = MIME::Types[file.content_type].first.extensions.first #better to check with myme type
    path = file.respond_to?(:path) ? file.path : file.tempfile.path
    if file.original_filename =~ /.mp3$/
      Mp3Info.open(path) do |r|
        @title = r.tag.title
        @artist = r.tag.artist
        @album = r.tag.album
        @tracknum = r.tag.tracknum
      end
    end
    params[:song].merge!(title: @title,artist: @artist,album: @album,tracknum: @tracknum)
  end

end
