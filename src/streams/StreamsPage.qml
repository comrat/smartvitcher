ContentPage {
	name: "streams";

	init: { this.initContentPage(api.getUserStreams, api.getGameStreams) }
}
