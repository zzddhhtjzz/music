package music.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import music.model.Playlist;
import music.model.User;

public class PlaylistDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("music");
	EntityManager em = factory.createEntityManager();
	
	public void createPlaylist(Playlist playlist) {
        // 用户注册方法
		em.getTransaction().begin();
		em.persist(playlist);
		em.getTransaction().commit();
        }
	
	public List<Playlist> readAllPlaylists(int userId)
	{
		Query query = em.createQuery("select playlist from Playlist playlist");
		List<Playlist> playlists=new ArrayList<Playlist>();
		List<Playlist> lists = (List<Playlist>)query.getResultList();
		
	for (Playlist list:lists)
	{
		if (list.getUser().getId()==userId)
		{
			playlists.add(list);
		}
	}
		return playlists;
	}
	public Playlist findPlaylistByid(Integer id)
	{
		
			return em.find(Playlist.class, id );
	
	}
	public Playlist updatePlaylist(Playlist playlist)
	{
		em.getTransaction().begin();
		em.merge(playlist);
		em.getTransaction().commit();
		return playlist;
	}
	// deletePlaylist
	public void deletePlaylist(Integer id) {
		em.getTransaction().begin();
		Playlist playlist = em.find(Playlist.class, id);
		em.remove(playlist);
		em.getTransaction().commit();
	}
}
