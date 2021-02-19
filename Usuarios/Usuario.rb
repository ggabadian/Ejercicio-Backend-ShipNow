class Usuario

    @username
    @passsword
    @rol

    def initialize(username, password, rol)    
        @username = username
        @password = password
        @rol = rol
    end

    def create_file(carpeta, filename, contenido)
        begin
            @rol.create_file(carpeta, filename, contenido)
        rescue FileExistsError
            puts "Ya existe un archivo con ese nombre"
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        end
    end

    def show_file(carpeta, filename)
        @rol.mostrar_archivo(carpeta, filename)
    end

    def show_metadata(carpeta, filename)
        @rol.show_metadata(carpeta, filename)
    end

    def crear_carpeta(carpeta_destino, nombre_nueva_carpeta)
        begin
            @rol.crear_carpeta(carpeta_destino, nombre_nueva_carpeta)
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        end
    end

    def eliminar_archivo(carpeta, filename)
        begin
            @rol.eliminar_archivo(carpeta, filename)
        rescue FileDoesNotExistError
            puts "No existe el archivo o la carpeta indicada"
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        end
    end

    def crear_usuario(username, password, rol)
        begin
            @rol.crear_usuario(username, password, rol)
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        rescue RolInexistenteError
            puts "No existe ese rol"
        rescue UsernameExistsError
            puts "El nombre de usuario ya existe"
        end
    end

    def eliminar_usuario(username)
        begin
            @rol.eliminar_usuario(username)
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        rescue UsernameDoesNotExistError
            puts "El nombre de usuario ya existe"
        end
    end

    def actualizar_password(new_password)
        begin
            @rol.actualizar_password(new_password, self)
        rescue PermisosInsuficientesError
            puts "No tiene permisos para realizar la operacion"
        end
    end

    def set_password(password)
        @password = password
    end

    def validate(password)
        return @password == password
    end

    def username
        @username
    end
end