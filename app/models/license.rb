class License < ApplicationRecord
    belongs_to :doctor

    def validate(record)
        if record != License.all.find_by(number:)
            record.errors[:base] << "This is not a valid doctor license!"
        end
    end

end
