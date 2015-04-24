package music.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Playlist {
@Id
	private Integer id;
	private String name;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId")
	private User user;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	public Playlist(Integer id, String name, User user) {
		super();
		this.id = null;
		this.name = name;
		this.user = user;
	}
	
	
	
	public Playlist() {
		super();
	}
}
