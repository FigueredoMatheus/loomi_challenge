extension onDurationExtensions on Duration {
  String playerTimerFormat() {
    final hours = this.inHours;
    final minutes = this.inMinutes;
    final seconds = this.inSeconds;

    int totalSeconds = hours * 3600 + minutes * 60 + seconds;

    int calculatedHours = totalSeconds ~/ 3600;

    int remainingSeconds = totalSeconds % 3600;
    int calculatedMinutes = remainingSeconds ~/ 60;

    int calculatedSeconds = remainingSeconds % 60;

    String formattedDuration = '';
    if (calculatedHours > 0) {
      formattedDuration += '${calculatedHours.toString().padLeft(2, '0')}:';
    }
    formattedDuration +=
        '${calculatedMinutes.toString().padLeft(2, '0')}:${calculatedSeconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }
}
