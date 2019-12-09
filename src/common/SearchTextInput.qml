Item {
	signal search;
	width: 1000s;
	height: 50s;

	TextInput {
		id: searchInput;
		x: 90s;
		width: 900s;
		height: 100%;
		placeholder.text: "User";
		backgroundColor: consts.panelColor;
		horizontalAlignment: Text.AlignHCenter;
		color: consts.textColor;
		font.pixelSize: 32s;
		radius: height / 2;

		onTextChanged: { searchDelayTimer.restart() }
	}

	Image {
		x: 20s;
		width: height;
		height: 100%;
		source: "res/search.png";
	}

	Timer {
		id: searchDelayTimer;
		interval: 2000;

		onTriggered: { this.parent.search(searchInput.text) }
	}

	onActiveFocusChanged: { if (value) searchInput.setFocus() }
}
