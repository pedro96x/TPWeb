package excepciones;

import org.apache.logging.log4j.Level;

public class ExceptionErrorGen extends Exception {
	int dni = 0;
	
	private String mensajeDeError;
	
	public ExceptionErrorGen(String msg)  {
	this.setMensajeDeError(msg);
}
	public String getMensajeDeError() {
		return mensajeDeError;
	}
	public void setMensajeDeError(String mensajeDeError) {
		this.mensajeDeError = mensajeDeError;
	}
	public void setDni(int dni) {
	this.dni = dni;
		
	}
	
	
}


