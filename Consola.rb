require "./Archivo.rb"
require "./Carpeta.rb"
require "./Regex.rb"
require "./Usuarios/RepoUsuarios.rb"
require "./Usuarios/Roles/Super.rb"
require "./Usuarios/Roles/Regular.rb"
require "./Usuarios/Roles/ReadOnly.rb"

root = Carpeta.new("root", Array.new, nil)
working_directory = root

repo = RepoUsuarios.instance
repo.agregar_usuario("admin", "admin", Super.new)

current_user = nil

loop do
    print (current_user.nil? ? "no_user" : current_user.username) + " @ " + working_directory.to_s

    comando = gets.chomp()
    
    case comando.split[0]
        when "exit"
            break

        when "create_file"
            match_data = REGEXP_CREATE_FILE.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.create_file(working_directory, match_data[:file_name],  match_data[:contenido])
                end
            end

        when "show"
            match_data = REGEXP_SHOW.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.show_file(working_directory, match_data[:file_name])
                end
            end
        
        when "metadata"
            match_data = REGEXP_METADATA.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.show_metadata(working_directory, match_data[:file_name])
                end
            end
        
        when "create_folder"
            match_data = REGEXP_CREATE_FOLDER.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.crear_carpeta(working_directory, match_data[:folder_name])
                end
            end
        
        when "cd"
            match_data = REGEXP_CD.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    folder_name = match_data[:folder_name]
                    if folder_name == ".." then
                        working_directory = working_directory.padre
                    else
                        carpeta = working_directory.get_carpeta(folder_name)
                        if carpeta.nil? then
                            puts "No existe la carpeta"
                        else
                            working_directory = carpeta
                        end
                    end
                end
            end
        
        when "destroy"
            match_data = REGEXP_DESTROY.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.eliminar_archivo(working_directory, match_data[:file_name])
                end
            end
        
        when "ls"
            match_data = REGEXP_LS.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    working_directory.mostrar_archivos
                end
            end
        
        when "whereami"
            puts working_directory.ruta_absoluta
        
        when "create_user"
            match_data = REGEXP_CR_USER.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.crear_usuario(match_data[:username], match_data[:password], match_data[:rol])
                end
            end

        when "destroy_user"
            match_data = REGEXP_DESTROY_USER.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.eliminar_usuario(match_data[:username])
                end
            end
        
        when "update_password"
            match_data = REGEXP_UPDATE_PASS.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                if current_user.nil? then
                    puts "Debe logearse para realizar la operacion"
                else
                    current_user.actualizar_password(match_data[:new_password])
                end
            end

        when "login"
            match_data = REGEXP_LOGIN.match(comando)
            if match_data.nil? then
                puts "Corrija los parametros"
            else
                begin
                    current_user = repo.login(match_data[:username], match_data[:password])
                rescue LoginFailedError
                    puts "credenciales incorrectas. vuelva a intentarlo"
                end
            end

        when "whoami"
            puts current_user.nil? ? "No user": current_user.username
        
        else
            puts "Comando no encontrado."
    end
   
end