PageActivity {
	id: contentPageProto;

	SearchTextInput {
		id: searchInput;
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
					contentGrid.findVideos(res.data[0].id, false, contentPageProto._getContentFunc)
				},
				function() {}
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
				}
			}

			onSelected(idx): {
				var row = this.model.get(idx)
				root.push("player", row)
			}
		}

		onUpPressed: { searchInput.setFocus() }
	}

	initContentPage(getContentFunc): {
		this._getContentFunc = getContentFunc
		if (contentGrid.count == 0)
			contentGrid.findVideos("121930779", false, getContentFunc)
		contentGrid.setFocus()
	}
}
