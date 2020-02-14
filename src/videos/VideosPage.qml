ContentPage {
	name: "videos";

	init: { this.initContentPage(api.getUserVideos, api.getGameVideos) }
}
