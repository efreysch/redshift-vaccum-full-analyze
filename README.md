The script requires the following arguments to run: 
		-h   RedShift Host
		-u   User name, super admin is required.
		-P   password for the redshift user
		-p   RedShift Port
		-d   Database name

Code run exmaple using environment variables:

```./vacuum-full-analyze-script.sh -h $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_HOST -u $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_USER -d $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_DATABASE -P $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_PASSWORD -p $REDSHIFT_MAINTENANCE_SECRET_REDSHIFT_PORT```

