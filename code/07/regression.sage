###########################################################################
# The linear regression of a data set.
###########################################################################

# Construct the data set.
X = list()
Y = list()
n = 10  # How many observations.
factor = 2
for i in range(n + 1):
    X.append(i)
    deviation = factor * random()
    Y.append(i + deviation)

# Construct the linear regression model.
xbar = mean(X)
ybar = mean(Y)
top = 0
bottom = 0
for i in range(n + 1):
    top += (X[i] - xbar) * (Y[i] - ybar)
    bottom += (X[i] - xbar)^2
b = top / bottom
a = ybar - b*xbar

# Plot the data set against the linear regression model.
p1 = list_plot(zip(X, Y))
p2 = plot(a*x + b, xmin=0, xmax=n)
