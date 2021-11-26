require 'csv'
namespace :csv do
  desc "Importa o arquivo dados.csv"
  task import: :environment do
    CSV.foreach('tmp/dados.csv', col_sep: ';').with_index do |linha, indice|
      unless (indice == 0)
        User.create!(name: linha[0], email: linha[1], address: linha[2])
      end

    end

  end

end
