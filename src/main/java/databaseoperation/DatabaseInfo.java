package databaseoperation;

//Interface for Database information
public interface DatabaseInfo {

	//Database information
	public static final String driver="oracle.jdbc.driver.OracleDriver";
	public static final String dbUrl="jdbc:oracle:thin:@localhost:1521:xe";
	public static final String dbUName="system";
    public static final String dbPassword="tiger";

}
