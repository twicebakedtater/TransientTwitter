package twitter;
import java.util.ArrayList;
import java.io.*;
import java.util.*;
public class User {
	
	private String username;
	private String password;
	private ArrayList<User> subscribedTo;
	private ArrayList<Tweet> tweets;
	
	private void init() {
		tweets = new ArrayList<Tweet>();
		subscribedTo =  new ArrayList<User>();
	}	
	
	User() {
		init();
	}

	public User(String u, String p) {
		init();
		username = u;
		password = p;
		save();
	}
	
	
	void setUsername(String un) {
		username = un;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String pw) {
		password = pw;
	}
	
	public String getPassword() {
		return password;
	}

	
	public void tweet(String text) {
		tweets.add(new Tweet(this,text));
		save();
	}
	
	public ArrayList<Tweet> getTweets() {
		return tweets;
	}

	public void subscribeTo(User u) {
		subscribedTo.add(u);
		save();
	}
	
	public void unsubscribeTo(User u) {
		subscribedTo.remove(u);
		save();
	}

	public ArrayList<User> getSubscribedTo() {
		return subscribedTo;
	}

	void load(String userFilename) {
	try{
		File f = new File(userFilename);
		BufferedReader br = new BufferedReader(new FileReader(f));
		br.readLine();
		br.readLine();
		br.readLine();
		String followee = br.readLine();
		while (!followee.equals("+TWEETS+")) {
			subscribedTo.add(UserRepository.instance().getUser(followee));
			System.out.println(followee);
			followee = br.readLine();
		}
		String tweetLine = br.readLine();
		while(tweetLine != null) {
			Tweet oldTweet = new Tweet(this,tweetLine);
			tweets.add(oldTweet);
			tweetLine = br.readLine();
			System.out.println("This is line before date" + tweetLine);
			oldTweet.setDate(new Long(tweetLine).longValue());
			tweetLine = br.readLine();
		}
		br.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	
	private void save() {
		try {
		PrintWriter pw = new PrintWriter(
			new FileWriter("/home/awegner/tomcat/webapps/hw6/twitter/" + username + ".user"));
		pw.println(username);
		pw.println(password);
		pw.println("~FOLLOWING~");
		for(User u2 : getSubscribedTo()) {	
			pw.println(u2.getUsername());
		}
		pw.println("+TWEETS+");
		for(Tweet t : getTweets()) {
			pw.println(t.getText());	
			pw.println(t.getDate().getTime());
		}
		pw.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}


