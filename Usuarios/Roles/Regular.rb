require "./Usuarios/Roles/Rol.rb"
require "./Errors/PermisosInsuficientesError.rb"

class Regular < Rol
    def create_file(carpeta, filename, contenido)
        carpeta.agregar_archivo(Archivo.new(filename, contenido))
    end

    def crear_carpeta(carpeta_destino, nombre_nueva_carpeta)
        begin
            carpeta_destino.agregar_carpeta(Carpeta.new(nombre_nueva_carpeta, Array.new, carpeta_destino))
        rescue FolderExistsError
            puts "Ya existe una carpeta con ese nombre"
        end
    end

    def eliminar_archivo(carpeta, filename)
        carpeta.eliminar_archivo(filename)
    end

    def actualizar_password(password, usuario)
        usuario.set_password(password)
    end
    
end