package model;

public class Charla {
	
	private Integer id;
	
	private Usuario usuario;

	private String titulo;
	
	private String detalle;

	public Charla(Integer id, Usuario usuario, String titulo, String detalle) {
		this.id = id;
		this.usuario = usuario;
		this.titulo = titulo;
		this.detalle = detalle;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	

}
