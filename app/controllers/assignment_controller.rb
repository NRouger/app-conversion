class AssignmentController < ApplicationController
  def index
  end

  def conversion
    if params[:q]
      # Split and analize the url query by index and spot
      # the different values and units
      query = params[:q].split(' ')
      value = query[0].to_f
      to_unit = query.last

      # if else statement to spot the first unit value
      if %w[kg lb m metres ft feet].include?(query[0].scan(/[a-zA-Z]/).join(''))
        from_unit = query[0].scan(/[a-zA-Z]/).join('')
      elsif %w[kg lb m metres ft feet].include?(query[1])
        from_unit = query[1]
      else
        from_unit = nil
      end

      # case statement for the convertion depending on the units values
      case [from_unit, to_unit]
      when %w[kg lb]
        converted_value = value * 2.20462
      when %w[lb kg]
        converted_value = value / 2.20462
      when %w[m ft]
        converted_value = value * 3.28084
      when %w[metres feet]
        converted_value = value * 3.28084
      when %w[ft m]
        converted_value = value / 3.28084
      when %w[feet metres]
        converted_value = value / 3.28084
      else
        converted_value = 'Introduce a valid unit conversion (kg-lb) (m-ft)'
      end
      # Render plain text as a response
      render plain: converted_value
    end
  end
end
