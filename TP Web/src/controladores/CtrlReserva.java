package controladores;

import java.sql.Date;
import java.util.ArrayList;

import data.DataAuto;
import data.DataReserva;
import entidades.Auto;
import entidades.Reserva;
import entidades.TipoAuto;
import manejoTiempo.NuevoDate;

public class CtrlReserva {
		DataReserva dataRes = new DataReserva();
		DataAuto dataAuto = new DataAuto();
		
		public ArrayList<Reserva> getReservas(){	
			return dataRes.getReservas();
			}
	
		public void setReserva(Reserva res) {
			dataRes.setReserva(res);
	}

	
//		NuevoDate.seSolapan(reservas.get(i).getFechaIni(),reservas.get(i).getFechaFin(),fechaI,fechaF))
	public ArrayList<Auto> getAutosDisponibles(String fechaI, String fechaF, ArrayList<Auto> arrayMismoTipoAutos) {
		ArrayList <Reserva> reservas = dataRes.getReservas();
		ArrayList <Auto> autosDisponibles = new ArrayList <Auto>();
		
		for (int i = 0; i < reservas.size(); i++) {
			for (int j = 0; j < arrayMismoTipoAutos.size(); j++) {
				java.sql.Date f1 = reservas.get(i).getFechaIni();
				java.sql.Date f2 = reservas.get(i).getFechaFin();
				if((reservas.get(i).getAutoReservado().getId()==arrayMismoTipoAutos.get(j).getId())&&(NuevoDate.seSolapan(f1,f2,fechaI,fechaF))){
					arrayMismoTipoAutos.remove(arrayMismoTipoAutos.get(j));
					
				}
			}
			
		}
		return arrayMismoTipoAutos;
	}
		


	public ArrayList<Reserva> getReservasAFututoByIdPersona(int id) {
		return dataRes.getReservasAFututoByIdPersona(id);
	}

	public void deleteById(int id) {
		dataRes.deleteById(id);
		
	}
	
}
