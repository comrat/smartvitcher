PageActivity {
	id: contentPageProto;

	SearchTextInput {
		id: searchLine;
		x: 160s;
		y: 30s;

		searchGame(request, append): {
			api.searchGame(request, function(search) {
				if (search && search.data && search.data.length)
					contentGrid.findVideos(search.data[0].id, append, contentPageProto._altGetContentFunc)
			}, function() {})
		}

		onSearch(request): {
			if (!request)
				return
			var self = this
			contentGrid.clear()
			api.getUsers(
				request,
				function(res) {
					if (!res || !res.data || res.data.length == 0) {
						self.searchGame(request, false)
					} else {
						contentGrid.findVideos(res.data[0].id, false, contentPageProto._getContentFunc)
						self.searchGame(request, true)
					}
				},
				function() { self.searchGame(request, true) }
			)
		}

		onDownPressed: { contentGrid.setFocus() }
	}

	Text {
		anchors.centerIn: parent;
		text: contentGrid.busy ? "Loading..." : "No content";
		color: consts.textColor;
		font.pixelSize: 32;
		visible: contentGrid.count == 0;
	}

	Item {
		y: 100s;
		width: 100%;
		height: 600s;
		clip: true;

		VideoGrid {
			id: contentGrid;
			x: 160s;
			y: 34s;

			onCurrentRowChanged: {
				var self = this
				if (value >= this.rows - 3 && this._next && !this.busy) {
					this.findVideos(this.contentId, true, contentPageProto._getContentFunc)
					this.findVideos(this.contentId, true, contentPageProto._altGetContentFunc)
				}
			}

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { searchLine.setFocus() }
	}

	initContentPage(getContentFunc, altGetContentFunc): {
		this._getContentFunc = getContentFunc
		this._altGetContentFunc = altGetContentFunc
		if (contentGrid.count == 0)
			contentGrid.findVideos("121930779", false, getContentFunc)
		contentGrid.setFocus()
	}
}
