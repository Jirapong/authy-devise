require 'devise-authy/hooks/authy_authenticatable'
module Devise
  module Models
    module AuthyAuthenticatable
      extend ActiveSupport::Concern

      def with_authy_authentication?(request)
        self.authy_id.present?
      end

      module ClassMethods
        def find_by_authy_id(authy_id)
          find(:first, :conditions => {:authy_id => authy_id})
        end
        ::Devise::Models.config(self, :api_key)
      end
    end
  end
end

