package music.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import music.model.User;

public class UserDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("music");
	EntityManager em = factory.createEntityManager();
	
	public void insertUser(User user) {
        // 用户注册方法
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

}
