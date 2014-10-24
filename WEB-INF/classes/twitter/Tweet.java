
package twitter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.*;
public class Tweet implements Comparable<Tweet> {

	private String text;
	private User author;
	private Date date;

	public Tweet(User author, String text) {
		this.text = text;
		this.author = author;
		date = new Date();
	}
	
	public String getText() {
		return text;
	}	 

	public User getAuthor() {
		return author;
	}

	public void setDate(long time) {
		date.setTime(time);
	}
	
	public Date getDate() {
		return date;
	}

	public int compareTo(Tweet t) {
		return date.compareTo(t.date);
	}
}
