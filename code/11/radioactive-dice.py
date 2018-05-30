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
    # At time t = 0, zero dice have decayed and you have 1000 dice that are
    # yet to decay.
    dataset = [(0, 0, ndice)]  # (t, d, r) := time, d decayed, r remaining

    # Repeat the simulation until all the 1000 dice have decayed.
    time = 1  # Time in minutes.
    while nremain > 0:
        ndecay, nremain = roll_dice(ndice, decay_state)
        dataset.append((time, ndecay, nremain))
        time += 1
        ndice = nremain

    # Write the experimental data to file.
    with open("radioactive-dice.csv", "w") as f:
        # Write the column headers.
        f.write("Time (minutes),How many decayed,How many remaining\n")
        # Write the experimental data.
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
    # Some sanity checks.
    assert isinstance(n, int)
    assert isinstance(decay_state, int)
    assert n > 0
    assert 1 <= decay_state <= 6

    ndecay = 0                      # How many dice have "decayed".
    die_state = (1, 2, 3, 4, 5, 6)  # All faces of a regular die.
    # Roll the given number of dice and note how many dice have "decayed".
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
