import themidibus.*; // imports the midibus library

class midi_ix {

  // MIDI-IX for Illuminatable
  // CreaTe 2014, University of Twente

  // ######## CONFIG ########
  // Configure midi-port, midi-channels used, scales for instruments and starting notes for instruments.

  String midiPort = "";// = "To Mainstage"; // change name of midi-port here.

  int instrumentChannel[] = {   // midi-channels to use for instruments
    1, 2, 3, 4
  };
  int scale[][] = { // define scales for instruments
    { 
      0, 3, 5, 7, 10, 12
    }
    , { 
      0, 3, 5, 7, 10, 12
    }
    , { 
      0, 3, 5, 7, 10, 12
    }
    , { 
      0, 3, 5, 7, 10, 12
    }
  };
  int startNote[] = { // start-note per instrument
    60, 60, 60, 60
  }; 

  // #######################

  ArrayList<Instrument> instruments;

  midi_ix() {
    
    // constructor. creates all neccessary instrument objects.
    midi = new MidiBus(this, -1, midiPort);
    instruments = new ArrayList<Instrument>();
    for (int i = 0; i<instrumentChannel.length; i++) {
      instruments.add(new Instrument(instrumentChannel[i], scale[i], startNote[i]));
    }
  }

  void activateNote(int instrumentID, ArrayList<Integer> noteAl) { 
    
    // passes commands along to instrument objects. supply instrumentID and note-array.
    Instrument instrument = instruments.get(instrumentID);
    int[] note = ArrayListToIntArray(noteAl);
    instrument.activateNote(note);
  }

  void shutUp() {
    
    for (int j =0; j<instrumentChannel.length; j++) {
      for (int i=0; i<128; i++) {
        midi.sendNoteOff(instrumentChannel[j], i, 127);
      }
    }
  }
}

int[] ArrayListToIntArray(ArrayList<Integer> arraylist) {
  
  int[] returnArray = new int[arraylist.size()];

  for (int i=0; i<arraylist.size (); i++) {
    int entry = arraylist.get(i);
    returnArray[i] = int(entry);
  }

  return returnArray;
}
