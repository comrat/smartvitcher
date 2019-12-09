ActivityManager {
	id: root;
	width: 1280s;
	height: 720s;

	TwitchApi { id: api; }
	Consts { id: consts; }

	//@using { src.videos.VideosPage }
	LazyActivity { name: "videos"; component: "src.videos.VideosPage"; }
	//@using { src.clips.ClipsPage }
	LazyActivity { name: "clips"; component: "src.clips.ClipsPage"; }
	//@using { src.streams.StreamsPage }
	LazyActivity { name: "streams"; component: "src.streams.StreamsPage"; }

	//@using { src.player.TwitchPlayerPage }
	LazyActivity { name: "player"; component: "src.player.TwitchPlayerPage"; }

	AppMenu {
		id: menu;
		visible: root.count == 1;

		onSelected(option): { root.replaceTopActivity(option.activity) }
	}

	onCompleted: {
		this.push("videos")
	}
}
