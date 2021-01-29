package ma.noobs.pet.util;

import org.aeonbits.owner.Config;
import org.aeonbits.owner.Config.Sources;

@Sources("classpath:config.ini")
public interface Configuration extends Config {

	@Key("database.connection.driver")
	String getDriver();

	@Key("database.connection.url")
	String getUrl();
	
	@Key("database.connection.username")
	String getUsername();
	
	@Key("database.connection.password")
	String getPassword();
	
	@Key("database.connection.dbname")
	String getDbName();

	@Key("database.connection.timezone")
	String getTimeZone();
	
}
