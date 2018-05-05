###########################################################################
# Generate random data on the half-life of a number of "radioactive" dice.
###########################################################################

import random

###########################################################################
# Helper functions.
###########################################################################

def main():
    """
    Generate some random data.
    """
    ndice = 1000     # How many dice.
    decay_state = 6  # The face with 6 pips is the decay state of a die.
    nremain = ndice
    dataset = [(0, 0, ndice)]  # (t, d, r) := time, d decayed, r remaining
    time = 1  # Time in minutes.
    while nremain > 0:
        ndecay, nremain = roll_dice(ndice, decay_state)
        dataset.append((time, ndecay, nremain))
        time += 1
        ndice = nremain

    with open("radioactive-dice.csv", "w") as f:
        f.write("Time (minutes),How many decayed,How many remaining\n")
        for time, ndecay, nremain in dataset:
            f.write("%d,%d,%d\n" % (time, ndecay, nremain))

def roll_dice(n, decay_state):
    """
    Roll the given number of dice.

    @param n Roll this many dice.
    @param decay_state The number of pips on a face of a die.  This number
        of pips indicates the decay state of a die.
    @return A tuple (d, r) that represents the number d of dice that have
        decayed and the number r of dice remaining (i.e. not yet decayed).
    """
    assert isinstance(n, int)
    assert isinstance(decay_state, int)
    assert n > 0
    assert 1 <= decay_state <= 6

    ndecay = 0
    die_state = (1, 2, 3, 4, 5, 6)
    for _ in range(n):
        state = random.choice(die_state)
        if state == decay_state:
            ndecay += 1
    nremain = n - ndecay
    return (ndecay, nremain)

###########################################################################
# Start here.
###########################################################################

main()
