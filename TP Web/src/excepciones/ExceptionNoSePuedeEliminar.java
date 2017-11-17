package excepciones;



public class ExceptionNoSePuedeEliminar extends Exception {
	private String mensajeDeError;
	
	public ExceptionNoSePuedeEliminar(String msg)  {
	this.setMensajeDeError(msg);
}
	public String getMensajeDeError() {
		return mensajeDeError;
	}
	public void setMensajeDeError(String mensajeDeError) {
		this.mensajeDeError = mensajeDeError;
	}}


