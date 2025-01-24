enum EmojiPreset {
  native('native'),
  apple('apple'),
  facebook('facebook'),
  google('google'),
  twitter('twitter');

  const EmojiPreset(this.preset);

  final String preset;
}
