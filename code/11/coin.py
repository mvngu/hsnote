###########################################################################
# Simulate the tossing of a fair coin.  Generate experimental data on the
# number of coin tosses required in order to get heads for the first time.
###########################################################################

import random

###########################################################################
# helper functions
###########################################################################

def main():
    """
    The driver function.
    """
    # Perform 10,000 rounds of the coin tossing experiment.  Each round
    # consists of repeatedly tossing a fair coin until heads occurs for the
    # first time.  The result of the round is the number of coin tosses
    # required in order for heads to show up for the first time.
    upper_limit = 10000  # How many times to perform the experiment.
    dataset = list()     # Store the experimental data here.
    for _ in range(upper_limit):
        dataset.append(time_to_heads())

    # Write the experimental data to file.
    with open("coin.csv", "w") as f:
        # The column header.
        f.write("Time to heads\n")
        # The experimental data, one number per line.
        for i in dataset:
            f.write("%d\n" % i)

def time_to_heads():
    """
    Simulate the number of coin tosses required in order for heads to occur
    for the first time.

    @return How many coin tosses were required for heads to come up for the
        first time.
    """
    heads = True
    result = toss_coin()
    n = 1  # How many coin tosses.

    # Continue to toss the coin until heads occurs for the first time.
    while result != heads:
        result = toss_coin()
        n += 1

    return n

def toss_coin():
    """
    Toss a fair coin.

    @return True if the result of the toss is heads; False otherwise.
    """
    # The possible outcomes of one toss of a fair coin.
    heads = True
    tails = False
    outcome = (heads, tails)

    return random.choice(outcome)

###########################################################################
# start here
###########################################################################

main()
