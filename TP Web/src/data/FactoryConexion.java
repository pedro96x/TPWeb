package data;
import java.sql.*;

//import ui;
//import entidades;
//import controladores;


public class FactoryConexion {
	
	private String driver="com.mysql.jdbc.Driver";
	private String host="node8910-javatp.fr-1.paas.massivegrid.net" ;  
	//private String host="localhost" ;               
	private String port="3306";
	private String user="root";
	private String password="RRRxlc56591";
	//private String password="5300";
	private String db="tp";
	
	private static FactoryConexion instancia;
		
	private FactoryConexion(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public static FactoryConexion getInstancia(){
		if (FactoryConexion.instancia == null){		
			FactoryConexion.instancia = new FactoryConexion();
		}
		return FactoryConexion.instancia;
		
	}
	
	private Connection conn;
	private int cantConn=0;
	public Connection getConn(){
		try {
			if(conn==null || conn.isClosed()){
				conn = DriverManager.getConnection(
			        "jdbc:mysql://"+host+":"+port+"/"+db+"?user="+user+"&password="+password+"&useSSL=false");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cantConn++;
		return conn;
	}
	
	public void releaseConn(){
		try {
			cantConn--;
			if (cantConn==0){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

