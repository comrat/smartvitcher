Activity {
	anchors.fill: parent;

	Rectangle {
		anchors.fill: parent;
		color: consts.backgroundColor;
	}

	onLeftPressed: { menu.setFocus() }
}
