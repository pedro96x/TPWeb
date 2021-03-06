package data;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.TipoAuto;
import excepciones.ExceptionErrorGen;
public class DataTipoAuto {



	
public TipoAuto getByID(int id){
		
		TipoAuto tipoauto = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select id, nombre_tipo_auto, cant_max_res, lim_max_tiempo_reserva, dias_de_ant_nec FROM tiposdeauto where id=?");
		stmt.setInt(1, id);
		rs = stmt.executeQuery();
			if (rs != null && rs.next()){
				tipoauto = new TipoAuto();
				tipoauto.setId(rs.getInt("id"));
				tipoauto.setNombre(rs.getString("nombre_tipo_auto"));
				tipoauto.setCantMaxReservas((rs.getInt("cant_max_res")));
				tipoauto.setLimMaxDeTiempoDeReserva((rs.getInt("lim_max_tiempo_reserva")));
				tipoauto.setMinDiasDeAnti((rs.getInt("dias_de_ant_nec")));
				
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
		
		return tipoauto;
	}
	
public void setTipoAuto(TipoAuto tipoauto){
		
	PreparedStatement stmt=null;
	ResultSet keyResultSet=null;
	
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into tiposdeauto( nombre_tipo_auto, cant_max_res, lim_max_tiempo_reserva, dias_de_ant_nec, permiso ) "
					+ " VALUES (?, ?, ?, ? , ?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, tipoauto.getNombre() );
			stmt.setInt(2, tipoauto.getCantMaxReservas() );
			stmt.setInt(3, tipoauto.getLimMaxDeTiempoDeReserva() );
			stmt.setInt(4, tipoauto.getMinDiasDeAnti() );
			stmt.setString(5, tipoauto.getPermiso() );
			 stmt.executeUpdate();
			 keyResultSet=stmt.getGeneratedKeys();
			 if(keyResultSet!=null && keyResultSet.next()){
				 tipoauto.setId(keyResultSet.getInt(1));
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


public void deleteByID(int id) throws ExceptionErrorGen{
	
PreparedStatement stmt=null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from tiposdeauto where id=?");
		stmt.setInt(1, id );
		 stmt.executeUpdate();
		
	} catch (SQLException e) {
		throw new ExceptionErrorGen("No se puede eliminar este tipo de auto debido "
										+ "a que existen reservas y/o autos que lo utilizan.");
    }
	
	try {
		if(stmt!=null)stmt.close();
		FactoryConexion.getInstancia().releaseConn();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}



public void actualiza(TipoAuto tipoauto){
	
PreparedStatement stmt=null;
	
	try{																	
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update tiposdeauto set nombre_tipo_auto = ?, cant_max_res = ?, lim_max_tiempo_reserva = ?, dias_de_ant_nec = ?, permiso = ? WHERE id = ?");
		stmt.setString(1, tipoauto.getNombre() );
		stmt.setInt(2, tipoauto.getCantMaxReservas() );
		stmt.setInt(3, tipoauto.getLimMaxDeTiempoDeReserva() );
		stmt.setInt(4, tipoauto.getMinDiasDeAnti() );
		stmt.setString(5, tipoauto.getPermiso() );
		stmt.setInt(6, tipoauto.getId() );
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


public ArrayList<TipoAuto> getArrayList() {
	
	TipoAuto tipoauto = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	ArrayList <TipoAuto> arrayTiposAutos = new ArrayList <TipoAuto>();	
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
				"select id, nombre_tipo_auto, cant_max_res, lim_max_tiempo_reserva, dias_de_ant_nec, permiso FROM tiposdeauto");
	
	rs = stmt.executeQuery();
		while (rs != null && rs.next()){
			tipoauto = new TipoAuto();
			tipoauto.setId(rs.getInt("id"));
			tipoauto.setNombre(rs.getString("nombre_tipo_auto"));
			tipoauto.setCantMaxReservas((rs.getInt("cant_max_res")));
			tipoauto.setLimMaxDeTiempoDeReserva((rs.getInt("lim_max_tiempo_reserva")));
			tipoauto.setMinDiasDeAnti((rs.getInt("dias_de_ant_nec")));
			tipoauto.setPermiso(rs.getString("permiso"));
			arrayTiposAutos.add(tipoauto);	
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
	return arrayTiposAutos;	 
}


public ArrayList<TipoAuto> getTipoAutosForUser() {
	TipoAuto tipoauto = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	ArrayList <TipoAuto> arrayTiposAutos = new ArrayList <TipoAuto>();	
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
				"select id, nombre_tipo_auto, cant_max_res, lim_max_tiempo_reserva, dias_de_ant_nec FROM tiposdeauto "
				+ "WHERE permiso ='ALL'");
	
	rs = stmt.executeQuery();
		while (rs != null && rs.next()){
			tipoauto = new TipoAuto();
			tipoauto.setId(rs.getInt("id"));
			tipoauto.setNombre(rs.getString("nombre_tipo_auto"));
			tipoauto.setCantMaxReservas((rs.getInt("cant_max_res")));
			tipoauto.setLimMaxDeTiempoDeReserva((rs.getInt("lim_max_tiempo_reserva")));
			tipoauto.setMinDiasDeAnti((rs.getInt("dias_de_ant_nec")));
			arrayTiposAutos.add(tipoauto);	
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
	return arrayTiposAutos;	
	}		
}

	
	
	
	
	
	
	

