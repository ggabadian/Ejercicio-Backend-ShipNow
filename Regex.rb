# #create_file
REGEXP_CREATE_FILE = /\Acreate_file (?<file_name>\S+) "(?<contenido>.*)"\z/

#show
REGEXP_SHOW = /\Ashow (?<file_name>\S+)\z/

#metadata
REGEXP_METADATA = /\Ametadata (?<file_name>\S+)\z/

#create_folder
REGEXP_CREATE_FOLDER = /\Acreate_folder (?<folder_name>\S+)\z/

#cd
REGEXP_CD = /\Acd (?<folder_name>\S+)\z/

#destroy
REGEXP_DESTROY = /\Adestroy (?<file_name>\S+)\z/
        
#ls
REGEXP_LS = /\Als\z/

#whereami
REGEXP_WHEREAMI = /\Awhereami\z/

#create_user
REGEXP_CR_USER = /\Acreate_user (?<username>\S+) (?<password>\S+) -role=(?<rol>\S+)\z/

#update_password
REGEXP_UPDATE_PASS = /\Aupdate_password (?<new_password>\S+)\z/

#destroy_user
REGEXP_DESTROY_USER= /\Adestroy_user (?<username>\S+)\z/

#login
REGEXP_LOGIN = /\Alogin (?<username>\S+) (?<password>\S+)\z/

#whoami
REGEXP_WHOAMI = /\Awhoami\z/