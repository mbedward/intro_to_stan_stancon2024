
data {
  int N;  // number of observations
  array[N] real<lower=0> y;  // observed values
}
parameters {
  // Unknown average value of waiting times
  real<lower=0> avg_duration;
}
model {
  // Relate the observed values to the unknown (to be estimated)
  // average duration
  y ~ exponential(1.0 / avg_duration);
}

