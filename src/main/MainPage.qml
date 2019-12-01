PageActivity {
	TextInput {
		id: searchInput;
		width: 480s;
		height: 50s;
		placeholder.text: "search";
		backgroundColor: "#ccc";
		font.pixelSize: 32s;
		horizontalAlignment: Text.AlignHCenter;
		radius: height / 2;

		onTextChanged: { searchDelayTimer.restart() }
	}

	Timer {
		id: searchDelayTimer;
		interval: 1000;

		onTriggered: {
			if (searchInput.text)
				api.searchGames(searchInput.text, function(res) { log("SEARCH",res) }, function(e) { log("Failed", e) })
		}
	}

	init: {
		searchInput.setFocus()
		api.getTopGames(50, function(res) { log("Top games", res) }, function() {})
	}
}
