class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  # GET /parks
  # GET /parks.json
  def index
    @parks = Park.all
    if params[:act] == 'delete'
      @park = Park.find_by_name(params[:name])
  	  if @park and @park.destroy
  	    render :json => {rtn: 'success'} and return
  	  else
  	    render :json => {rtn: 'failed'} and return
  	  end
  	end
  	if params[:act] == 'search'
  	  @park = Park.find_by_name(params[:name])
  	  if @park
  	    render :json => {rtn: 'success'} and return
  	  else
  	    render :json => {rtn: 'failed'} and return
  	  end
  	end
  	if params[:act] == 'create'
      @park = Park.new
  	  @park.name = params[:name] if params[:name]
  	  @park.floor = params[:floor] if params[:floor]
  	  @park.number = params[:number] if params[:number]
  	  @park.phone = params[:phone] if params[:phone]
  	  if not Park.find_by_name(params[:name])
        if not Park.where(:floor => params[:floor], :number => params[:number]).exists? and @park.save
          render :json => {rtn: 'success'} and return
        else
          render :json => {rtn: 'failed: position exists'} and return
        end
      else
        render :json => {rtn: 'failed: name exists'} and return
      end

  	end
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(park_params)

    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, notice: 'Park was successfully created.' }
        format.json { render :show, status: :created, location: @park }
      else
        format.html { render :new }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { render :show, status: :ok, location: @park }
      else
        format.html { render :edit }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park.destroy
    respond_to do |format|
      format.html { redirect_to parks_url, notice: 'Park was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.require(:park).permit(:name, :floor, :number, :phone)
    end
end
