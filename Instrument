// Class that contains the individual instruments. One object of this class per instrument.

class Instrument {

  int channel;
  int scale[];
  int startNote;

  int[] notesActive = {
  };

  Instrument(int channel, int scale[], int startNote) {
    this.channel = channel;
    this.scale = scale;
    this.startNote = startNote;
  }

  void activateNote(int[] notes) {

    if (notesActive.length > 0) {
      for (int j = 0; j<notesActive.length; j++) {
        boolean noteOn = false;
        for (int k = 0; k<notes.length; k++) {
          if (notes[k] == notesActive[j]) {
            noteOn = true;
          }
        }
        if (!noteOn) {
          midi.sendNoteOff(channel, scale[notesActive[j]]+startNote, 127);
        }
      }
    }


    for (int i = 0; i<notes.length; i++) {
      boolean noteOn = false;
      if (notesActive.length > 1) {
        for (int l = 0; l<notesActive.length; l++) {
          if (notesActive[l] == notes[i]) {
            noteOn = true;
          }
        }
      }
      if (!noteOn) {
        midi.sendNoteOn(channel, scale[notes[i]]+startNote, 127);
      }
    }
    notesActive = notes;
  }
}
