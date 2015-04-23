package music.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
	@Id
private int id;
private String username;
private String password;
private String sex;
private String description;
public User(int id, String name, String password, String sex, String descri) {
	super();
	this.id = id;
	this.username = name;
	this.password = password;
	this.sex = sex;
	this.description = descri;
}
public User() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return username;
}
public void setUsername(String name) {
	this.username = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getDescription() {
	return description;
}
public void setDescription(String descri) {
	this.description = descri;
}
}
