
data {
  int N;  // total number of observations
  int M;  // number of locations
  array[N] real<lower=0> y;  // observed values
  array[N] int x;  // location index (from 1) for each observation
}
parameters {
  // Unknown average value of waiting time at each location
  array[M] real<lower=0> avg_duration;
}
model {
  // Relate the observed values to the unknown (to be estimated)
  // average duration. 
  // Note how we don't need an explicit loop here although we could do that 
  // for clarity at the expense of slightly longer computation time.
  // Also note that if we did 1.0/avg_duration[x] this would provoke an error
  // from Stan which is very picky about vector lengths etc.
  //
  y ~ exponential(avg_duration[x]^(-1));
}

