PageActivity {
	name: "streams";

	SearchTextInput {
		id: streamSearchInput;
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
					streamGrid.findVideos(res.data[0].id, false, api.getUserStreams)
				},
				function() {}
			)
		}

		onDownPressed: { streamGrid.setFocus() }
	}

	Text {
		anchors.centerIn: parent;
		text: streamGrid.busy ? "Loading..." : "No content";
		color: consts.textColor;
		font.pixelSize: 32;
		visible: streamGrid.count == 0;
	}

	Item {
		y: 100s;
		width: 100%;
		height: 600s;
		clip: true;

		VideoGrid {
			id: streamGrid;
			x: 160s;
			y: 34s;

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { streamSearchInput.setFocus() }
	}

	init: {
		if (streamGrid.count == 0)
			streamGrid.findVideos("121930779", false, api.getGameStreams)
		streamGrid.setFocus()
	}
}
