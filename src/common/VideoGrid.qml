GridView {
	signal selected;
	property bool busy;
	property bool userMode;
	property int currentRow;
	property string contentId;
	width: 1100s;
	height: 500s;
	spacing: 10s;
	cellWidth: 250s;
	cellHeight: 200s;
	contentY: Math.floor(currentIndex / columns) * (cellHeight + spacing);
	animationDuration: consts.animationDuration;
	keyNavigationWraps: false;
	cssTranslatePositioning: true;
	contentFollowsCurrentItem: false;
	handleNavigationKeys: false;
	model: ListModel { }
	delegate: VideoDelegate { onPressed(idx): { this.parent.selected(idx) } }

	onCurrentIndexChanged: { this.currentRow = Math.floor(value / this.columns) }

	onKeyPressed: {
		if (!this.recursiveVisible || this.count == 0)
			return false

		var columnCount = this.columns
		var column = this.currentIndex % columnCount
		switch (key) {
			case 'Up': return this.moveUp()
			case 'Down': return this.moveDown()
			case 'Left':
				if (column == 0)
					return false
				else
					return this.moveLeft()
			case 'Right':
				if (column >= columnCount - 1)
					return false
				else
					return this.moveRight()
		}
	}

	onCurrentRowChanged: {
		var self = this
		if (value >= this.rows - 3 && this._next && !this.busy && this.method) {
			this.findVideos(this.contentId, true, this.method)
		}
	}

	findVideos(contentId, append, method): {
		this.busy = true
		var self = this
		this.contentId = contentId
		this.method = method
		method(
			this.contentId,
			this._next ? this._next : "",
			function(res) {
				self._next = res.pagination.cursor
				if (append)
					self.append(res)
				else
					self.fill(res)
				self.busy = false
			},
			function() { self.busy = false }
		)
	}

	clear: { this.model.clear() }
	fill(res): { this.model.assign(res.data) }
	append(res): { this.model.append(res.data) }
}
