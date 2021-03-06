module Homeland
  class Configuration
    # Markup type, [:markdown, :plain, :html], defualt: :markdown
    attr_accessor :markup
    # class name of you User model, default: 'User'
    attr_accessor :user_class

    # method of user name in User model, default: 'name'
    attr_accessor :user_name_method

    # method of user avatar in User model, default: nil
    #
    # We suggest you give Homeland image size more than 48x48 px.
    #
    # Example:
    #
    # class User
    #   def homeland_avatar_url
    #     self.avatar.url('48x48')
    #   end
    # end
    #
    # config.user_avatar_url_method = :homeland_avatar_url
    #
    attr_accessor :user_avatar_url_method

    # method in User model for check user do have permission manage Homeland.
    # default: 'admin?'
    #
    # Example:
    #
    # class User
    #   def admin?
    #     Setting.forum_admins.include?(self.email)
    #   end
    # end
    attr_accessor :user_admin_method

    # method name of user profile page path, in User model, default: 'profile_url'
    # Example:
    #
    # class User
    #   def profile_url
    #     "http://www.host.com/u/#{self.username}"
    #   end
    # end
    #
    # config.user_profile_url_method = 'profile_url'
    attr_accessor :user_profile_url_method

    # current_user method name in your Controller, default: 'current_user'
    attr_accessor :current_user_method

    # authenticate_user method in your Controller, default: 'authenticate_user!'
    attr_accessor :authenticate_user_method

    # set Homeland Application Title, default: 'Homeland'
    attr_accessor :app_name

    # pagination size, default: 32
    attr_accessor :per_page

    # Content markup, allow: [:markdown, :html, :simple], default: :markdown
    attr_accessor :markup

    attr_accessor :node_colors
  end
end
