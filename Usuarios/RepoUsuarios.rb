require "./Usuarios/Usuario.rb"
require "./Errors/UsernameExistsError.rb"
require "./Errors/LoginFailedError.rb"

class RepoUsuarios
  @instance = new
  @usuarios
  
  private_class_method :new

  def self.instance
    @instance
  end

  def agregar_usuario(username, password, rol)
    if @usuarios.nil? then
      @usuarios = Array.new
    end
    if get_user(username).nil? then
      @usuarios.push(Usuario.new(username, password, rol))
    else
      raise UsernameExistsError
    end    
  end

  def eliminar_usuario(username)
    usuario = get_user(username)
    if usuario.nil? then
      raise UsernameDoesNotExistError
    else
      @usuarios.delete(usuario)
    end    
  end

  def get_user(username)
    @usuarios.find{|u| u.username == username}
  end

  def login(username, password)
    user = get_user(username)
    if user.nil? then
      raise LoginFailedError
    elsif user.validate(password) then
      return user
    else
      raise LoginFailedError
    end

  end
end