class ProductPreparation < ApplicationRecord
  # Callbacks
  # Associacoes
  has_many :preparation_items
  # Validacoes
  accepts_nested_attributes_for :preparation_items
  # Escopos

  # Metodos estaticos
  # Metodos publicos

  # Metodos GET
  # Metodos SET

  # Nota: os metodos somente utilizados em callbacks ou utilizados somente por essa
  #       propria classe deverao ser privados (remover essa anotacao)
end
