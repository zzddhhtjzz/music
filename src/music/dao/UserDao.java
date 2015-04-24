package music.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import music.model.Playlist;
import music.model.User;

public class UserDao {
	EntityManagerFactory fplaylisty = Persistence.createEntityManagerFactory("music");
	EntityManager em = fplaylisty.createEntityManager();
	
	public void insertUser(User user) {
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
        }

	public List<User> judgeUserPassword(String userName, String userPassword) {
		Query query = em.createQuery("select user from User user where user.username=?1 and user.password=?2");
		query.setParameter(1,userName);  
		query.setParameter(2,userPassword);  
		return (List<User>) query.getResultList();
	}
	
	public void updateUser(int userId, User user) {
		List<User> users = new ArrayList<User>();
		em.getTransaction().begin();
		
		user.setId(userId);
		em.merge(user);

		em.getTransaction().commit();
		
		
		
	}
	
	public void addPlaylist(Integer userId, Playlist playlist)
	{
		em.getTransaction().begin();
		User user = em.find(User.class, userId);
		playlist.setUser(user);
		user.getPlaylists().add(playlist);
		em.merge(user);
		em.getTransaction().commit();
	}
	
	public User findUserById(int id)
	{
		return em.find(User.class, id);
	}
	
	public List<User> removeUser(int userId){
		List<User> users = new ArrayList<User>();
		User user = null;

		em.getTransaction().begin();
		
		user = em.find(User.class, userId);
		em.remove(user);
		
		Query query = em.createQuery("select user from User user");
		users = (List<User>) query.getResultList();
		
		em.getTransaction().commit();
		
		return users;
	}
	public List<User> findAllUsers() {
		List<User> users = new ArrayList<User>();
		Query query = em.createQuery("select user from User user");
		users = (List<User>) query.getResultList();

		return users;
	}
	
}
