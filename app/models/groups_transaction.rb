class GroupsTransaction < ApplicationRecord
  belongs_to :grouped_transaction, class_name: 'Transaction'
  belongs_to :transaction_grouper, class_name: 'Group'
end
