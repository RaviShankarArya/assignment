require 'csv'

namespace 'import' do
  desc "Import Colors"
  task 'colors' => :environment do
    BackgroundColor.destroy_all
    BackgroundColor.connection.execute("truncate background_colors RESTART IDENTITY CASCADE")

    path = File.join(Rails.root, "db", "csv_data", "colors.csv")
    csv_table = CSV.table(path, {:headers => true, :converters => nil, :header_converters => :symbol})
    headers = csv_table.headers
    csv_table.each_with_index do|row, index|
      row.headers.each{ |cell| row[cell] = row[cell].to_s.strip }
      next if row[:name].blank?
      color = BackgroundColor.new
      color.name = row[:name]
      color.code = row[:code]
      if color.valid?
        color.save
        puts "#{color.name} with code #{color.code} is created"
      else
        p "Error! #{color.errors.full_messages.to_sentence}"
      end
    end
  end

  desc "Import events"
  task 'events' => :environment do
    Event.destroy_all
    Event.connection.execute("truncate events RESTART IDENTITY CASCADE")

    path = File.join(Rails.root, "db", "csv_data", "events.csv")
    csv_table = CSV.table(path, {:headers => true, :converters => nil, :header_converters => :symbol})
    headers = csv_table.headers
    csv_table.each_with_index do|row, index|
      row.headers.each{ |cell| row[cell] = row[cell].to_s.strip }
      next if row[:title].blank?
      event = Event.new
      event.title = row[:title]
      event.description = row[:description]
      event.background_color_id = row[:background_color_id]
      if event.valid?
        event.save
        puts "#{event.title} is created"
      else
        p "Error! #{event.errors.full_messages.to_sentence}"
      end
    end
  end
end
