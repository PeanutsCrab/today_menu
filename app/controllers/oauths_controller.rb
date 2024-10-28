class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false
      
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(auth_params[:provider])
  end
      
  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, success: t('user_sessions.create.success')
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, success: t('user_sessions.create.success')
      rescue
        flash.now[:danger] = t('user_sessions.create.failure')
        redirect_to root_path, status: :unprocessable_entity
      end
    end
  end
  
  #example for Rails 4: add private method below and use "auth_params[:provider]" in place of 
  #"params[:provider] above.

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end
end