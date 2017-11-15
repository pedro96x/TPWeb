package data;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Auto;
import entidades.Reserva;
import entidades.TipoAuto;

public class DataReserva {
	public void setReserva(Reserva res){
		
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into reservas (fechain,fechafin,detalle,auto_reservado,id_persona) values(?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setDate(1,res.getFechaIni());
			stmt.setDate(2,res.getFechaFin());
			stmt.setString(3,res.getDetalle());
			stmt.setInt(4,res.getAutoReservado().getId());
			stmt.setInt(5,res.getIdPersona());
			
			
			 stmt.executeUpdate();
			 keyResultSet=stmt.getGeneratedKeys();
			 if(keyResultSet!=null && keyResultSet.next()){
				 res.setId(keyResultSet.getInt(1));
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

	public ArrayList<Reserva> getReservas(){
		
		PreparedStatement stmt = null;
		ResultSet rs=null;
		ArrayList<Reserva> reservas= new ArrayList<Reserva>();
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().prepareStatement("SELECT * FROM tp.reservas res "
							+ "inner join autos aut "
							+ "on aut.id_auto = res.auto_reservado "
							+ "inner join tiposdeauto tip "
							+ "on tip.id = aut.id_tipoauto ");
			
			rs = stmt.executeQuery();
			if(rs!=null){
				while(rs.next()){
					Reserva res=new Reserva();
					res.setId(rs.getInt("res.id"));
					res.setFechaIni(rs.getDate("res.fechain"));
					res.setFechaFin(rs.getDate("res.fechafin"));
					res.setDetalle(rs.getString("res.detalle"));
					res.setIdPersona(rs.getInt("res.id_persona"));
				
					Auto au = new Auto();
					au.setNombre(rs.getString("aut.nombre"));
					au.setId(rs.getInt("aut.id_auto"));
					
					TipoAuto tipo = new TipoAuto();
					tipo.setId(rs.getInt("tip.id"));
					tipo.setNombre(rs.getString("tip.nombre_tipo_auto"));
					tipo.setCantMaxReservas(rs.getInt("tip.cant_max_res"));
					tipo.setLimMaxDeTiempoDeReserva(rs.getInt("tip.lim_max_tiempo_reserva"));
					tipo.setMinDiasDeAnti(rs.getInt("tip.dias_de_ant_nec"));
					
					au.setTipo(tipo);
					res.setAutoReservado(au);

					reservas.add(res);
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
		
		return reservas;
		
	}

	public ArrayList<Reserva> getReservasAFututoByIdPersona(int id) {
		PreparedStatement stmt = null;
		ResultSet rs=null;
		ArrayList<Reserva> reservas= new ArrayList<Reserva>();
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().prepareStatement("SELECT * FROM tp.reservas res "
							+ "inner join autos aut "
							+ "on aut.id_auto = res.auto_reservado "
							+ "inner join tiposdeauto tip "
							+ "on tip.id = aut.id_tipoauto "
							+ "where res.id_persona = ? and res.fechain>curdate()");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs!=null){
				while(rs.next()){
					Reserva res=new Reserva();
					res.setId(rs.getInt("res.id"));
					res.setFechaIni(rs.getDate("res.fechain"));
					res.setFechaFin(rs.getDate("res.fechafin"));
					res.setDetalle(rs.getString("res.detalle"));
					res.setIdPersona(rs.getInt("res.id_persona"));
				
					Auto au = new Auto();
					au.setNombre(rs.getString("aut.nombre"));
					au.setId(rs.getInt("aut.id_auto"));
					
					TipoAuto tipo = new TipoAuto();
					tipo.setId(rs.getInt("tip.id"));
					tipo.setNombre(rs.getString("tip.nombre_tipo_auto"));
					tipo.setCantMaxReservas(rs.getInt("tip.cant_max_res"));
					tipo.setLimMaxDeTiempoDeReserva(rs.getInt("tip.lim_max_tiempo_reserva"));
					tipo.setMinDiasDeAnti(rs.getInt("tip.dias_de_ant_nec"));
					
					au.setTipo(tipo);
					res.setAutoReservado(au);

					reservas.add(res);
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
		
		return reservas;
		
	}

	public void deleteById(int id) {
		PreparedStatement stmt=null;
		
		
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"delete from reservas where id=?");
			
			stmt.setInt(1, id);
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

	public void update(Reserva res) {
		PreparedStatement stmt=null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update reservas set id = ?, fechain = ?, fechafin = ?, detalle = ?, auto_reservado = ?, id_persona = ? WHERE id = ?");
			
			stmt.setInt(1, res.getId());
			stmt.setDate(2, res.getFechaIni() );
			stmt.setDate(3, res.getFechaFin() );
			stmt.setString(4, res.getDetalle());
			stmt.setInt(5	, res.getAutoReservado().getId());
			stmt.setInt(6, res.getIdPersona() );
			stmt.setInt(7, res.getId());
			
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

	public ArrayList<Auto> getAutosDisponiblesByFechasAndTipo(java.util.Date fechaI, java.util.Date fechaF, int idTipoAuto) {
		
		ArrayList<Auto> autos = new ArrayList<Auto>();
//		autos =null;
		Auto auto=null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select aut.id_auto, aut.id_tipoauto, aut.nombre,"
					+ " tipo.nombre_tipo_auto, tipo.lim_max_tiempo_reserva, tipo.dias_de_ant_nec, tipo.cant_max_res"
					+ " from autos aut"
					+ " inner join tiposdeauto tipo"
					+ " on tipo.id = aut.id_tipoauto"
					+ " where aut.id_tipoauto = ? "
					+ " and aut.id_auto not in("
					+ " select au.id_auto "
					+ " from reservas res "
					+ " inner join autos au"
					+ " on au.id_auto = res.auto_reservado"
					+ " inner join tiposdeauto tip"
					+ " on tip.id = au.id_tipoauto"
					+ " where au.id_tipoauto=? "
					+ " and "
					+ " (( ? between res.fechain and res.fechafin) "
					+ " or "
					+ " ( ? between res.fechain and res.fechafin) "
					+ " or "
					+ " (res.fechain between  ? and  ? )"
					+ " or"
					+ " (res.fechafin between  ?  and  ? ))"
					+ " )"
					+ " ;");
			
			stmt.setInt(1, idTipoAuto);
			stmt.setInt(2, idTipoAuto);
			stmt.setDate(3, new java.sql.Date(fechaI.getTime()));
			stmt.setDate(4, new java.sql.Date(fechaF.getTime()));
			stmt.setDate(5, new java.sql.Date(fechaI.getTime()));
			stmt.setDate(6, new java.sql.Date(fechaF.getTime()));
			stmt.setDate(7, new java.sql.Date(fechaI.getTime()));
			stmt.setDate(8, new java.sql.Date(fechaF.getTime()));
		rs = stmt.executeQuery();
			while (rs != null && rs.next()){
				auto = new Auto();
				auto.setNombre(rs.getString("aut.nombre"));
				auto.setId(rs.getInt("aut.id_auto"));
				
				TipoAuto tipo = new TipoAuto();
				tipo.setId(rs.getInt("aut.id_tipoauto"));
				tipo.setNombre(rs.getString("tipo.nombre_tipo_auto"));
				tipo.setCantMaxReservas(rs.getInt("tipo.cant_max_res"));
				tipo.setLimMaxDeTiempoDeReserva(rs.getInt("tipo.lim_max_tiempo_reserva"));
				tipo.setMinDiasDeAnti(rs.getInt("tipo.dias_de_ant_nec"));
				auto.setTipo(tipo);

				
				
				autos.add(auto);
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
		return autos;
	}

	
	
	
	
	
	
//	public ArrayList<Auto> getAutosDisponibles (date fechain, date fechaFin, TipoAuto tipo ){
//		
//	}
	
	
	
	
	
	}

	