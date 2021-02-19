class Archivo
    @nombre
    @fecha_creacion
    @contenido

    def initialize(nombre, contenido)
        @nombre = nombre
        @fecha_creacion = Time.now
        @contenido = contenido
    end

    def to_s
        @nombre
    end

    def mostrar
        puts @contenido
    end

    def nombre
        @nombre
    end

    def mostrar_metadata
        puts "Fecha de creación: #{@fecha_creacion}"
    end
end