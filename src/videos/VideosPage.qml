PageActivity {
	name: "videos";

	SearchTextInput {
		id: videoSearchInput;
		x: 160s;
		y: 30s;

		onSearch(request): {
			if (!request)
				return
			api.getUsers(
				request,
				function(res) {
					if (!res || !res.data || res.data.length == 0)
						return
					api.getUserVideos(res.data[0].id, function(videos) { videosGrid.fill(videos) }, function() {})
				},
				function() {}
			)
		}

		onDownPressed: { videosGrid.setFocus() }
	}

	Item {
		y: 100s;
		width: 100%;
		height: 600s;
		clip: true;

		VideoGrid {
			id: videosGrid;
			x: 160s;
			y: 34s;

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { videoSearchInput.setFocus() }
	}

	init: {
		if (videosGrid.count == 0)
			api.getGameVideos(488552, function(res) { videosGrid.fill(res) }, function() {})
		videosGrid.setFocus()
	}
}
