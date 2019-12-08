PageActivity {
	name: "player";

	IFrame {
		id: embed;
		anchors.fill: parent;
	}

	onStopped: {
		embed.source = ""
	}

	init(data): {
		embed.source = "https://player.twitch.tv/?video=" + data.id
	}
}
