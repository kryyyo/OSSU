import java.util.ArrayList;
import java.util.List;

public class Playlist implements IComponent {
	public String playlistName;
	public List<IComponent> playlist = new ArrayList<>();

	public Playlist(String playlistName) {
		this.playlistName = playlistName;
	}

  @Override
  public void play() {
    for (IComponent iComponent : playlist) {
      iComponent.play();
    }
  }

  @Override
  public void setPlaybackSpeed(float speed) {
    for (IComponent iComponent : playlist) {
      iComponent.setPlaybackSpeed(speed);
    }
  }

  @Override
  public String getName() {
    return this.playlistName;
  }

  public void add(IComponent component) {
    this.playlist.add(component);
  }

  public void remove(IComponent component) {
    this.playlist.remove(component);
  }
}
