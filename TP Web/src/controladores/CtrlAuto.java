package controladores;

import java.util.ArrayList;

import data.DataAuto;
import entidades.Auto;
import excepciones.ExceptionNoSePuedeEliminar;

public class CtrlAuto {
	DataAuto dataAuto = new DataAuto();
	public void setAuto(Auto auto) {
		dataAuto.setAuto(auto);
	}
	public void baja(int id) throws ExceptionNoSePuedeEliminar {
		dataAuto.bajaByID(id);
	}
	public void actualizar(Auto auto) {
dataAuto.actualiza(auto);		
	}
	public Auto getByID(int id) {
		return dataAuto.getByID(id);
		
	}
	public ArrayList<Auto> getAutosByID(int id) {
		return dataAuto.getAutosByID(id);
	}
	public ArrayList<Auto> getArrayList() {
		// TODO Auto-generated method stub
		return dataAuto.getArrayList();
	}

}
