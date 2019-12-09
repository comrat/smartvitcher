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
		else if (state && state.lastActivity == "streams")
			embed.source = "https://player.twitch.tv/?channel=" + data.user_name
		else
			embed.source = "https://player.twitch.tv/?video=" + data.id
	}
}
