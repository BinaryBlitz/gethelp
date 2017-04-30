class ChangeCodeInVerificationTokens < ActiveRecord::Migration
  def change
    change_column :verification_tokens, :code, :string, null: false
  end
end
