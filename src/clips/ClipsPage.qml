PageActivity {
	name: "clip";

	SearchTextInput {
		id: clipSearchInput;
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
					clipGrid.findVideos(res.data[0].id, false, api.getUserClips)
				},
				function() {}
			)
		}

		onDownPressed: { clipGrid.setFocus() }
	}

	Text {
		anchors.centerIn: parent;
		text: clipGrid.busy ? "Loading..." : "No content";
		color: consts.textColor;
		font.pixelSize: 32;
		visible: clipGrid.count == 0;
	}

	Item {
		y: 100s;
		width: 100%;
		height: 600s;
		clip: true;

		VideoGrid {
			id: clipGrid;
			x: 160s;
			y: 34s;

			onCurrentRowChanged: {
				var self = this
				if (value >= this.rows - 3 && this._next && !this.busy) {
					this.findVideos(this.contentId, true, api.getUserClips)
				}
			}

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { clipSearchInput.setFocus() }
	}

	init: {
		if (clipGrid.count == 0)
			clipGrid.findVideos("121930779", false, api.getUserClips)
		clipGrid.setFocus()
	}
}
