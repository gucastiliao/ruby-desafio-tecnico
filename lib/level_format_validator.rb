class LevelFormatValidator < ActiveModel::EachValidator
    def validate_each(object, attribute, value)
        if (value)
            if (value === 0 || value > 5)
                object.errors[attribute] << (options[:message] || "Nível inválido.") 
            end
        end
    end
end
