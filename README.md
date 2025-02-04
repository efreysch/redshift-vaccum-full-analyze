The script requires the following arguments to run: 
	
| Argument  | Explanation |
| ------------- | ------------- |
| -h  | RedShift Host  |
| -p  | RedShift Port  |
| -d  | Database name  |
| -u  | Username, privileges required.  |
| -P  | Password  |  
		   

Code run example using environment variables:

```./vacuum-full-analyze-script.sh -h $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_HOST -u $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_USER -d $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_DATABASE -P $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_PASSWORD -p $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_PORT```

