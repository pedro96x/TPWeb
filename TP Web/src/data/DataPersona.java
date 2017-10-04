package data;

import java.util.ArrayList;

import entidades.Auto;
import entidades.Persona;
import entidades.Reserva;

import java.sql.*;

public class DataPersona {
	public Persona getByDni(int docu){
		
		Persona p = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select id, nombre, apellido, dni, habilitado, user, pass FROM personasTP where dni=?");
		stmt.setInt(1, docu);
		rs = stmt.executeQuery();
			if (rs != null && rs.next()){
				p = new Persona();
				p.setId(rs.getInt("id"));
				p.setApellido(rs.getString("apellido"));
				p.setNombre(rs.getString("nombre"));
				p.setDni(rs.getInt("dni"));
				p.setHabilitado(rs.getBoolean("habilitado"));
				p.setUser(rs.getString("user"));
				p.setPass(rs.getString("pass"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	public void setPersona(Persona per){
		
	PreparedStatement stmt=null;
	ResultSet keyResultSet=null;
	
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into personastp(dni , nombre , apellido , habilitado, user , pass ) VALUES (?, ?, ?, ?, ?, ?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, per.getDni() );
			stmt.setString(2, per.getNombre() );
			stmt.setString(3, per.getApellido() );
			stmt.setBoolean(4, per.isHabilitado() );
			stmt.setString(5, per.getUser());
			stmt.setString(6, per.getPass());
			 stmt.executeUpdate();
			 keyResultSet=stmt.getGeneratedKeys();
			 if(keyResultSet!=null && keyResultSet.next()){
				 per.setId(keyResultSet.getInt(1));
			 			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
        }
		try {
			if(keyResultSet!=null)keyResultSet.close();
			if(stmt!=null)stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}


public void deleteByDni(int dni){
	
PreparedStatement stmt=null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from personastp where dni=?");
		stmt.setInt(1, dni );
		 stmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
    }
	
	try {
		if(stmt!=null)stmt.close();
		FactoryConexion.getInstancia().releaseConn();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}



public void actualiza(Persona per){
	
PreparedStatement stmt=null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update personastp set dni = ?, nombre = ?, apellido = ?, habilitado = ?, user = ?, pass = ? WHERE dni = ?");
		stmt.setInt(1, per.getDni() );
		stmt.setString(2, per.getNombre() );
		stmt.setString(3, per.getApellido() );
		stmt.setBoolean(4, per.isHabilitado() );
		stmt.setString(5, per.getUser());
		stmt.setString(6, per.getPass());
		stmt.setInt(7, per.getDni() );
		 stmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
    }
	
	try {
		if(stmt!=null)stmt.close();
		FactoryConexion.getInstancia().releaseConn();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}


public ArrayList<Persona> getAll() {
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Persona> personas= new ArrayList<Persona>();
		Persona p= null; 
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select id, nombre, apellido, dni, habilitado, user, pass FROM personasTP ;");
			if(rs!=null){
				while(rs.next()){
					p = new Persona();
					p.setId(rs.getInt("id"));
					p.setApellido(rs.getString("apellido"));
					p.setNombre(rs.getString("nombre"));
					p.setDni(rs.getInt("dni"));
					p.setHabilitado(rs.getBoolean("habilitado"));
					p.setUser(rs.getString("user"));
					p.setPass(rs.getString("pass"));
					personas.add(p);
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		

		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
	
//									Carga manual para probar que funcionaran otras cosas 
//		Persona p = new Persona();
//		p.setApellido("Probando");
//		p.setDni(123456);
//		p.setHabilitado(true);
//		p.setId(1000);
//		p.setNombre("esto");
//		p.setPass("12345");
//		p.setUser("pedroxxx");
//		
//		Persona pe = new Persona();
//		pe.setApellido("Probando2");
//		pe.setDni(1234567777);
//		pe.setHabilitado(true);
//		pe.setId(1001);
//		pe.setNombre("esto2");
//		pe.setPass("12345");
//		pe.setUser("pedroxxx2");
//		
//		personas.add(p);
//		personas.add(pe);
		return personas;
		
	}

	
	
	
	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
