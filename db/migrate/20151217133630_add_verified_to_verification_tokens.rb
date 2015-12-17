class AddVerifiedToVerificationTokens < ActiveRecord::Migration
  def change
    add_column :verification_tokens, :verified, :boolean, default: false
  end
end
