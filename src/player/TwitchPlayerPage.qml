PageActivity {
	name: "player";

	IFrame {
		id: embed;
		anchors.fill: parent;
	}

	onStopped: {
		embed.source = ""
	}

	init(data, state): {
		if (state && state.lastActivity == "clips")
			embed.source = "https://clips.twitch.tv/embed?clip=" + data.id
		else
			embed.source = "https://player.twitch.tv/?video=" + data.id
	}
}
