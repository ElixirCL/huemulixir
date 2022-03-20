import * as Tone from '../../vendor/tone.js';

const Huemul = {
  mounted() {
      // from https://tonejs.github.io/
      const synth = new Tone.PolySynth(Tone.Synth).toDestination();
      const now = Tone.now()
      synth.triggerAttack("D4", now);
      synth.triggerAttack("F4", now + 0.5);
      synth.triggerAttack("A4", now + 1);
      synth.triggerAttack("C5", now + 1.5);
      synth.triggerAttack("E5", now + 2);
      synth.triggerRelease(["D4", "F4", "A4", "C5", "E5"], now + 4);
  }
};

export {Huemul};
