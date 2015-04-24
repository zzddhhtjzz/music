package music.dao;

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
        // �û�ע�᷽��
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

}
