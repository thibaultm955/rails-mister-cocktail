class DosesController < ApplicationController

    def index
        @doses = Dose.all
        @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
    end

    def create
        @dose = Dose.new(params_dose)
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose.cocktail = @cocktail
        if @dose.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    def destroy
        @cocktail = Cocktail.find(params[:id])
        Dose.find(params[:cocktail_id]).delete
        redirect_to cocktail_path(@cocktail)
    end

    private

    def params_dose
        params.require(:dose).permit(:description, :ingredient_id)
    end
end
