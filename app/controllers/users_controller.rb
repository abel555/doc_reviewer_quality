class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authorize_admin, only: [:create, :update]
  $path_to_change_pass = '/users/change_password'

  def index
    @users = User.where(:career => current_user.career).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def change_password
    @user =  current_user
  end

  def update_password
    @user = current_user
    validate_password
  end

  private


  def validate_password
    if (new_pass_is_valid)
      if (is_password_equal_to_confirmation)
        if (new_password_is_not_empty)
          redirect_to $path_to_change_pass, alert: 'Las contraseñas no pueden estar en blanco.'
        else
          if (new_password_is_equal_to_old)
            redirect_to $path_to_change_pass, alert: 'No se puede usar la misma contraseña.'
          else
            current_user.password = params[:user][:password]
            check_if_password_has_been_saved
          end
        end
      else
        flash[:alert] = "Las contraseñas no coinciden."
        redirect_back fallback_location: $path_to_change_pass
      end
    else
      redirect_to $path_to_change_pass, alert: 'Debe ingresar su contraseña.'
    end
  end

  def new_password_is_not_empty
    params[:user][:password].blank?
  end

  def new_pass_is_valid
    current_user.valid_password?(params[:user][:current_password])
  end

  def new_password_is_equal_to_old
    params[:user][:password] == params[:user][:current_password]
  end

  def check_if_password_has_been_saved
    if current_user.save
      flash[:alert] = "Se cambio la contraseña correctamente."
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      redirect_to $path_to_change_pass, alert: 'La contraseña debe tener al menos 6 caracteres.'
    end
  end

  def is_password_equal_to_confirmation
    params[:user][:password] == params[:user][:password_confirmation]
  end

  def authorize_admin
    return unless !current_user.director? && !current_user.present?
    redirect_to root_path, alert: 'Solo Directores!'
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :username, :career, :phone, :role, :email, :admin_role, :tutor_role, :relator_role, :professor_role, :professional_degree, :password, :password_confirmation)
  end
end
