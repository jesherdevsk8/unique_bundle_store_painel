class GenerateSpreadsheetJob < ApplicationJob
  queue_as :default

  def perform(products)
    workbook = RubyXL::Workbook.new

    tab = workbook.worksheets[0]
    tab.sheet_name = 'Product Spreadsheet'

    header = ['Item Name', 'Item Description', 'Listing ID', 'Seller SKU', 'Price', 'Quantity', 'Product ID Type', 'ASIN1', 'ASIN2', 'ASIN3', 'ID Product', 'Status', 'Fulfillment Channel', 'Total Unit Count 30 days', 'Total Sales Amount 30 days', 'Total Unit Count 7 days', 'Total Sales Amount 7 days', 'Resolver Stock', 'Supplier URL', 'Pending Customer Order Quantity', 'Created At', 'Updated At']
    header.each.with_index(0) { |data, row| tab.add_cell(0, row, data) }

    products.each.with_index(1) do |data, col|
      tab.add_cell(col, 0, data.item_name)
      tab.add_cell(col, 1, data.item_description)
      tab.add_cell(col, 2, data.listing_id)
      tab.add_cell(col, 3, data.seller_sku)
      tab.add_cell(col, 4, data.price)
      tab.add_cell(col, 5, data.quantity)
      tab.add_cell(col, 6, data.product_id_type)
      tab.add_cell(col, 7, data.asin1)
      tab.add_cell(col, 8, data.asin2)
      tab.add_cell(col, 9, data.asin3)
      tab.add_cell(col, 10, data.id_product)
      tab.add_cell(col, 11, data.status)
      tab.add_cell(col, 12, data.fulfillment_channel)
      tab.add_cell(col, 13, data.total_unit_count)
      tab.add_cell(col, 14, data.total_sales_amount)
      tab.add_cell(col, 13, data.total_unit_count_7)
      tab.add_cell(col, 14, data.total_sales_amount_7)
      tab.add_cell(col, 15, data.resolver_stock)
      tab.add_cell(col, 16, data.supplier_url)
      tab.add_cell(col, 17, data.pending_customer_order_quantity)
      tab.add_cell(col, 18, data.created_at.strftime('%d/%m/%Y'))
      tab.add_cell(col, 19, data.updated_at.strftime('%d/%m/%Y'))
    end

    workbook.stream.read
  end
end
