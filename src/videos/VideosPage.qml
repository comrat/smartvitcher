PageActivity {
	id: videosPageProto;
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
					videosGrid.findVideos(res.data[0].id, false, api.getUserVideos )
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

			onCurrentRowChanged: {
				var self = this
				if (value >= this.rows - 3 && this._next && !this.busy) {
					this.findVideos(this.contentId, true, api.getUserVideos)
				}
			}

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { videoSearchInput.setFocus() }
	}

	init: {
		if (videosGrid.count == 0)
			videosGrid.findVideos("121930779", false, api.getUserVideos)
		videosGrid.setFocus()
	}
}
