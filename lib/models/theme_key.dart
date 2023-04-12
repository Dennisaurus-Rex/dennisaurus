enum ThemeKey {
  teal('teal'),
  darthTeal('darth teal'),
  orange('orange'),
  darthOrange('darth orange'),
  pink('pink'),
  darthPink('darth pink'),
  purple('purple'),
  darthPurple('darth purple'),
  blue('blue'),
  darthBlue('darth blue'),
  green('green'),
  darthGreen('darth green'),
  red('red'),
  darthRed('darth red');

  final String name;
  const ThemeKey(this.name);
  factory ThemeKey.fromName(String name) {
    return ThemeKey.values.firstWhere((e) => e.name == name);
  }
}
