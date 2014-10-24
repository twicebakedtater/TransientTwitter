package twitter;
import java.util.Hashtable;
import java.io.*;
import java.util.*; 

public class UserRepository {
	
	private static UserRepository myInstance;
	private Hashtable<String, User> users;
	

	public static UserRepository instance() throws Exception {
		if(myInstance == null) {
			myInstance = new UserRepository();
			myInstance.bootstrap();
		}
		return myInstance;
	}
	private UserRepository() {
		users = new Hashtable<String,User>();
	}
	private void bootstrap() {
		try{
		File dir = new File("/home/awegner/tomcat/webapps/hw6/twitter/");
		File[] files = dir.listFiles();
		if(files != null) {
			for(File twitter : files) {
				BufferedReader br = new BufferedReader(new FileReader(twitter));
				String username = br.readLine();
				String password = br.readLine();
				User u = new User();
				u.setUsername(username);
				u.setPassword(password);
				users.put(username, u);	
				br.close();
			}
			for(User u : getAllUsers()) {
				u.load("/home/awegner/tomcat/webapps/hw6/twitter/" + u.getUsername() + ".user");
			}
		}
		}catch(Exception e){
			System.out.println("Couldn't bootstrap");
				e.printStackTrace();
		}
	}
		
	public User getUser(String username) {
		return users.get(username);
		}

	public User createNewUser(String username, String password) {
		User u = new User(username, password);
		users.put(username, u);
		return u;
	}

	public Collection<User> getAllUsers() {
		return users.values();
	}

}
