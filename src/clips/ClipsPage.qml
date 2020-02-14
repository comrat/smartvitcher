ContentPage {
	name: "clip";

	init: { this.initContentPage(api.getUserClips, api.getGameClips) }
}
