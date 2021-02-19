require "./Errors/FileExistsError.rb"
require "./Errors/FileDoesNotExistError.rb"
require "./Errors/FolderExistsError.rb"

class Carpeta < Archivo

    @padre

    def initialize(nombre, contenido, padre)
        super(nombre, contenido)
        @padre = padre
    end

    def agregar_archivo(archivo)
        if get_archivo(archivo.nombre).nil? then
            @contenido.push(archivo)
        else
            raise FileExistsError
        end
    end

    def mostrar_archivos
        puts @contenido
    end

    def get_archivo(file_name)
        @contenido.select{|a| a.class==Archivo}.find{|a| a.nombre == file_name}
    end

    def get_carpeta(folder_name)
        @contenido.select{|a| a.class==Carpeta}.find{|a| a.nombre == folder_name}
    end

    def agregar_carpeta(carpeta)
        if get_carpeta(carpeta.nombre).nil? then
            @contenido.push(carpeta)
        else
            raise FolderExistsError
        end
    end

    def ruta_absoluta
        if @padre.nil? then
            return @nombre + "/"
        else
            return @padre.ruta_absoluta + @nombre + "/"
        end
    end

    def padre
        if @padre.nil? then
            return self
        else
            return @padre
        end
    end

    def eliminar_archivo(file_name)
        file = @contenido.find{|a| a.nombre ==file_name}
        if file.nil?
            raise FileDoesNotExistError
        else
            @contenido.delete(file)
        end
    end

    def to_s
        super + "/"
    end
end