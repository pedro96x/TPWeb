package excepciones;



public class ExceptionErrorGen extends Exception {
	private String mensajeDeError;
	
	public ExceptionErrorGen(String msg)  {
	this.setMensajeDeError(msg);
}
	public String getMensajeDeError() {
		return mensajeDeError;
	}
	public void setMensajeDeError(String mensajeDeError) {
		this.mensajeDeError = mensajeDeError;
	}}


