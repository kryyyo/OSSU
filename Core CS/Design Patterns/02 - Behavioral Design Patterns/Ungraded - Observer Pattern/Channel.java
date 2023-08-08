import java.util.ArrayList;

public class Channel implements Subject {
  private ArrayList<Observer> observers;
	private String channelName;
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public void notifyObservers() {
		observers.forEach(observer -> observer.update(status));
	}

	@Override
	public void registerObserver(Observer observer) {
		observers.add(observer);
	}

	@Override
	public void removeObserver(Observer observer) {
		observers.remove(observer);
	}
}