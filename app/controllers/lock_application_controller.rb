module LockApplicationController
  module ClassMethods
    def lock(opts={})
      before_filter { |c| c.lock_filter opts[:actions] }
    end
  end

  module InstanceMethods
    def lock_filter(actions=nil)
      redirect_to lock_login_url if locked_action?(actions) && session[:lock_opened] != true
    end

    def locked_action?(actions)
      return false if controller_name == "lock"
      actions.blank? || actions.include?("#{controller_name}") || actions.include?("#{controller_name}##{action_name}")
    end
  end
end
