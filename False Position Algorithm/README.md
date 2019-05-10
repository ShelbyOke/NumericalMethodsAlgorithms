This algorithm will estimate the root (zero) of a given function. The function will take 2 bounds that bracket a root given by the user and form a line between them. The x-intercept between these points will become the new guess, and the process will continue until the given stopping criterion is met.

# Inputs:
func = the function being evaluated
xl = the lower guess
xu = the upper guess
es = the desired relative error (defaults to 0.0001%)
maxiter = the number of iterations desired (defaults to 200)

# Outputs:
root = the estimated root location
fx = the function evaluated at the root
ea = the approximate relative percent error
iter = how many iterations were performed
