class AlbumsController < ApplicationController
  before_action :set_album, only: [:update, :destroy]
  before_filter :clear_flash

  def index
    @albums = Album.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = 'Album was successfully created.'
      @albums = Album.all
    else
      flash[:error] = @album.errors.full_messages.join(', ')
    end
  end

  def update
    @album.assign_attributes(album_params)
    if @album.save
      flash[:notice] = 'Album was successfully updated.'
    else
      flash[:error] = @album.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @album.destroy
      flash[:notice] = 'Album deleted successfully'
    else
      flash[:error] = 'Album could not be deleted'
    end
    @albums = Album.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :artist, :year, :genre)
    end

    def clear_flash
      flash.clear
    end
end
