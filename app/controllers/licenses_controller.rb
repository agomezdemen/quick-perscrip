class LicensesController < ApplicationController

    def new
        @license = License.new
    end

    def create
        @license.save
    end
end