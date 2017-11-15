package excepciones;

public class ExceptionNoHayAutos extends Exception {
	private String mensajeDeError="no se puede";
	public ExceptionNoHayAutos()  {
	System.out.println("Log de errores");
}
	public String getMensajeDeError() {
		return mensajeDeError;
	}
	public void setMensajeDeError(String mensajeDeError) {
		this.mensajeDeError = mensajeDeError;
	}}