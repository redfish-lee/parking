class Api::V1::ParksController < Api::V1::ApplicationController
  before_action :set_park, only: [:show, :update, :destroy]

  # GET /parks
  # GET /parks.json
  def index
    @parks = Park.all

    render json: @parks
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
    if @park
      render json: { rtn: 'success' }
    else
      render json: { rtn: 'failed' }
    end
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(park_params)

    if @park.invalid?
      render json: { rtn: 'failed: name exists'  }
    elsif not @park.overlap? and @park.save
      render json: { rtn: 'success' }
    else
      render json: { rtn: 'failed: position exists' }
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    if @park.update(park_params)
      render json: @park, status: :ok, location: @park
    else
      render json: @park.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    if @park and @park.destroy
      render json: { rtn: 'success' }
    else
      render json: { rtn: 'failed' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find_by_name(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.permit(:name, :floor, :number, :phone)
    end
end
