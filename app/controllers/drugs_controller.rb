class DrugsController < ApplicationController

    def new
        @drug = Drug.new
    end

    def create
        @drug.save
    end

    private

    def drug_params
        params.require(:drug).permit(:name)
    end
end