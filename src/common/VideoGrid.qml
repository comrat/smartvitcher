GridView {
	signal selected;
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

	onKeyPressed: {
		if (!this.recursiveVisible)
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

	fill(res): { this.model.assign(res.data) }
}
