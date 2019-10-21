class LocationFormatValidator < ActiveModel::EachValidator
    def validate_each(object, attribute, value)
        if (value)
            unless %w(a b c d e f).include?(value.downcase)
                object.errors[attribute] << (options[:message] || "Localização inválida.") 
            end
        end
    end
end
