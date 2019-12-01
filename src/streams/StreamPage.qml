PageActivity {
	name: "streams";

	Item {
		y: 100s;
		width: 100%;
		height: 554s;
		clip: true;

		GridView {
			id: streamsView;
			x: 60s;
			y: 34s;
			width: 1150s;
			height: 500s;
			keyNavigationWraps: false;
			cellWidth: 150s;
			cellHeight: 250s;
			cssTranslatePositioning: true;
			animationDuration: consts.animationDuration;
			spacing: 10s;
			model: ListModel { }
			delegate: PosterDelegate { }

			fill(res): {
				streamsView.model.assign(res.data)
			}
		}
	}

	init: {
		api.getTopGames(21, function(res) { streamsView.fill(res) }, function() {})
		streamsView.setFocus()
	}
}
