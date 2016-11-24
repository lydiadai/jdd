class AddCancelToOrder < ActiveRecord::Migration[5.0]
    def change
        add_column :orders, :is_cancel, :boolean, default: false
    end
end
