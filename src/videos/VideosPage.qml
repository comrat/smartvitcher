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
					videosGrid.contentId = res.data[0].id
					api.getUserVideos(videosGrid.contentId, function(videos) { videosGrid.fill(videos) }, function() {})
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
					this.busy = true
					api.getUserVideos(
						this.contentId,
						this._next,
						function(res) { self._next = res.pagination.cursor; videosGrid.append(res); self.busy = false },
						function() { self.busy = false }
					)
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
		if (videosGrid.count == 0) {
			videosGrid.contentId = 121930779
			api.getUserVideos(videosGrid.contentId, function(res) { videosGrid._next = res.pagination.cursor; videosGrid.fill(res) }, function() {})
		}
		videosGrid.setFocus()
	}
}
