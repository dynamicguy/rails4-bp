module Workers
  class DeleteAccount < Base
    sidekiq_options queue: :delete_account
    
    def perform(account_deletion_id)
      account_deletion = AccountDeletion.find(account_deletion_id)
      account_deletion.perform!
    end
  end
end
