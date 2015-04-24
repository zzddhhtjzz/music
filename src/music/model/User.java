package music.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class User {
	@Id
private int id;
private String username;
private String password;
private String sex;
private String description;
private String type; 
@OneToMany(mappedBy="user")
private List<Playlist> Playlists;

public List<Playlist> getPlaylists() {
	return Playlists;
}
public void setPlaylists(List<Playlist> playlists) {
	Playlists = playlists;
}
public String getUsername() {
	return username;
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

public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public User(int id, String username, String password, String sex,
		String description,String type ,List<Playlist> playlists) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.sex = sex;
	this.description = description;
	this.Playlists = playlists;
	this.type=type;
}
public User() {
	super();
}


}
