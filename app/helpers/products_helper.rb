module ProductsHelper

  def date_format(date)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month = months[date.strftime('%-m').to_i - 1]
    day = date.strftime('%d')
    year = date.strftime('%Y')

    "#{month} #{day}, #{year}"
  end

  def simple_description(description)
    description.truncate(100)
  end
end
