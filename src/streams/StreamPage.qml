PageActivity {
	name: "streams";

	Item {
		y: 100s;
		width: 100%;
		height: 554s;
		clip: true;

		GridView {
			id: streamsView;
			x: 190s;
			y: 34s;
			width: 1000s;
			height: 500s;
			spacing: 10s;
			cellWidth: 150s;
			cellHeight: 250s;
			contentY: Math.floor(currentIndex / columns) * (cellHeight + spacing);
			animationDuration: consts.animationDuration;
			keyNavigationWraps: false;
			cssTranslatePositioning: true;
			contentFollowsCurrentItem: false;
			handleNavigationKeys: false;
			model: ListModel { }
			delegate: PosterDelegate { onPressed(idx): { this.parent.select(idx) } }

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

			fill(res): { streamsView.model.assign(res.data) }

			select(idx): {
				var row = this.model.get(idx)
			}
		}
	}

	init: {
		api.getTopGames(25, function(res) { streamsView.fill(res) }, function() {})
		streamsView.setFocus()
	}
}
