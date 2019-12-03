ActivityManager {
	id: root;
	width: 1280s;
	height: 720s;

	TwitchApi { id: api; }
	Consts { id: consts; }

	//@using { src.videos.VideosPage }
	LazyActivity { name: "videos"; component: "src.videos.VideosPage"; }

	AppMenu { id: menu; onSelected(idx): { log("IDX",idx) } }

	onCompleted: {
		this.push("videos")
	}
}
