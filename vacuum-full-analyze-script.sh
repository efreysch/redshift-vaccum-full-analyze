# version 1.0
# Adapted by: Erik Freyschuss (inspiration from TheDataGuy - Copyright (c) 2020 Bhuvanesh)

# Set some default values for all the variables
host=unset
user=unset
password=unset
port=unset
database=unset


echo `date '+%Y-%m-%d %H:%M:%S'` "Starting the process....."
# Usage function to help other to understand the arguments
usage()
{
  echo "Usage: [ Read the instructions below ]
		-h   RedShift Host
		-u   User name, super admin is required.
		-P   password for the redshift user
		-p   RedShift Port
		-d   Database name
  "
  exit 2
}

# Get the values from the input and validate them
[ $# -eq 0 ] && usage
while getopts ":h:u:P:p:d:" arg; do
  case $arg in
 
    h ) host=$OPTARG;;
    u ) user=$OPTARG;;
	P ) password=$OPTARG;;
	p ) port=$OPTARG;;
	d ) database=$OPTARG;;
 	*) echo "Unexpected option: $1 - this should not happen."
      usage
      exit 0
      ;;
  esac
done

echo `date '+%Y-%m-%d %H:%M:%S'` "Validating the Host,User,Database arguments"
# Host, Username, Database are mandatory parameters, exit if one of the argument is not available.
if [[ $host == 'unset' ]]; then
    echo "Host option a was NOT given, exit."
    usage
    exit 1;
elif [[ $user == 'unset' ]]; then
    echo "User option a was NOT given, exit."
    usage
    exit 1;
elif [[ $database == 'unset' ]]; then
    echo "Database option a was NOT given, exit."
    usage
    exit 1;    
elif [[ $password == 'unset' ]]; then
    echo "Password option a was NOT given, exit."
    usage
    exit 1;   
elif [[ $port == 'unset' ]]; then
    echo "Port option a was NOT given, exit."
    usage
    exit 1;  
fi

echo `date '+%Y-%m-%d %H:%M:%S'` "Perfect all the mandatory arguments are set"

# Export the password if the user provides.
if [[ $password ]]
then
	export PGPASSWORD=$password
	echo `date '+%Y-%m-%d %H:%M:%S'` "User provided password will be used"
fi

# Execute VACUUM FULL
echo `date '+%Y-%m-%d %H:%M:%S'` "Running command: VACUUM FULL;"
psql -h $host -U $user -p $port -d $database -c "VACUUM FULL;"
# Execute ANALYZE
echo `date '+%Y-%m-%d %H:%M:%S'` "Running command: ANALYZE;"
psql -h $host -U $user -p $port -d $database -c "ANALYZE;"

# Clear the password from the environment variable
unset PGPASSWORD

echo $(date '+%Y-%m-%d %H:%M:%S') "Script completed."
