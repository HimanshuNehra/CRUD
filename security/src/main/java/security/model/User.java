package security.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;





@Entity
@Table(name = "UserDetails")
public class User {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;
	
	
	public String email;
	
	
	
	private String password;
	
	
	public String username;
	
	public int admin;
	
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "password [email=" + email + ", password=" + password + ", username=" + username + ",admin=" + admin+ "]";
	}
	public User(int id,String email,  String password, String username) {
		super();
		this.id=id;
		this.email = email;
		this.password = password;
		this.username = username;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
