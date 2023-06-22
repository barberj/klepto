class AddRawParamsToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :raw_params, :json
  end
end
