
package model;

public class Usuario extends Persona {
	
	private Integer id;
	
	private String categoria;
	
	private String nombre;
	
	private String apellido;
	
	private String email;
	
	private String password;
	
	private Boolean es_admin;
	
	private Integer telefono;

	public Usuario(Integer id, String categoria, String nombre, String apellido, String email, String password,
			Boolean es_admin, Integer telefono) {
		super();
		this.id = id;
		this.categoria = categoria;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.password = password;
		this.es_admin = es_admin;
		this.telefono = telefono;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEs_admin() {
		return es_admin;
	}

	public void setEs_admin(Boolean es_admin) {
		this.es_admin = es_admin;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}
}
