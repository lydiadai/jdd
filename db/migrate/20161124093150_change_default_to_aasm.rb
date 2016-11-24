class ChangeDefaultToAasm < ActiveRecord::Migration[5.0]
    def change
        change_column :orders, :aasm_state, :string, default: 'order_placed'
    end
end
