class Rol
    def mostrar_archivo(carpeta, filename)
        archivo = carpeta.get_archivo(filename)
        if archivo.nil? then
            puts "No existe el archivo"
        else
            archivo.mostrar
        end
    end
    
    def show_metadata(carpeta, filename)
        archivo = carpeta.get_archivo(filename)
        if archivo.nil? then
            puts "No existe el archivo"
        else
            archivo.mostrar_metadata
        end
    end

    def create_file(carpeta, filename, contenido)
        raise PermisosInsuficientesError
    end

    def crear_carpeta(carpeta_destino, nombre_nueva_carpeta)
        raise PermisosInsuficientesError
    end

    def eliminar_archivo(carpeta, filename)
        raise PermisosInsuficientesError
    end

    def crear_usuario(username, password, rol_name)
        raise PermisosInsuficientesError
    end

    def actualizar_password(password, usuario)
        raise PermisosInsuficientesError
    end

    def eliminar_usuario(usuario)
        raise PermisosInsuficientesError
    end
end