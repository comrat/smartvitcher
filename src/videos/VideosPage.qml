PageActivity {
	name: "videos";

	Item {
		y: 100s;
		width: 100%;
		height: 554s;
		clip: true;

		VideoGrid {
			id: videosGrid;
			x: 160s;
			y: 34s;

			onSelected(idx): {
				var row = this.model.get(idx)
			}
		}
	}

	init: {
		api.getGameVideos(488552, function(res) { videosGrid.fill(res) }, function() {})
		videosGrid.setFocus()
	}
}
