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
					api.getUserStreams(res.data[0].id, function(stream) { streamGrid.fill(stream) }, function() {})
				},
				function() {}
			)
		}

		onDownPressed: { streamGrid.setFocus() }
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
			api.getGameStreams(488552, function(res) { streamGrid.fill(res) }, function() {})
		streamGrid.setFocus()
	}
}
