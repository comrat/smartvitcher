ActivityManager {
	id: root;
	width: 1280s;
	height: 720s;

	TwitchApi { id: api; }
	Consts { id: consts; }

	//@using { src.streams.StreamPage }
	LazyActivity { name: "streams"; component: "src.streams.StreamPage"; }

	AppMenu { id: menu; }

	onCompleted: {
		this.push("streams")
	}
}
