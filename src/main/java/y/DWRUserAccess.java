package y;

public class DWRUserAccess {
	UserDao userDAO = new UserDao();
	 
    public boolean save(User user) {
      return userDAO.save(user);
    }

    public User find(String id) {
      return userDAO.find(id);
    }
}
