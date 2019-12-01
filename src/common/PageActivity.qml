Activity {
	anchors.fill: parent;

	Rectangle {
		anchors.fill: parent;
		color: consts.backgroundColor;
	}

	onUpPressed: { menu.setFocus() }
}
