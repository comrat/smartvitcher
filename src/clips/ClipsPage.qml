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
					api.getUserClips(res.data[0].id, function(clip) { clipGrid.fill(clip) }, function() {})
				},
				function() {}
			)
		}

		onDownPressed: { clipGrid.setFocus() }
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

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { clipSearchInput.setFocus() }
	}

	init: {
		if (clipGrid.count == 0)
			api.getGameClips(488552, function(res) { clipGrid.fill(res) }, function() {})
		clipGrid.setFocus()
	}
}
