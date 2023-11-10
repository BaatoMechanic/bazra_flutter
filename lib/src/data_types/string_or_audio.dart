import 'dart:io';

abstract class StringOrAudio {
  const StringOrAudio();
}

class StringData extends StringOrAudio {
  final String stringValue;

  StringData(this.stringValue);
}

class AudioData extends StringOrAudio {
  final File audioFile;

  AudioData(this.audioFile);
}
