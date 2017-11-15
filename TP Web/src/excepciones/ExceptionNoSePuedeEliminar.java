package excepciones;



public class ExceptionNoSePuedeEliminar extends Exception {
	private String mensajeDeError="No se puede eliminar este tipo de auto debido a que existen reservas que lo utilizan.";

	public ExceptionNoSePuedeEliminar()  {
	
}
	public String getMensajeDeError() {
		return mensajeDeError;
	}
	public void setMensajeDeError(String mensajeDeError) {
		this.mensajeDeError = mensajeDeError;
	}}


