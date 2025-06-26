
parameters {
  real<lower=0> duration;
}
model {
  duration ~ exponential(1.0 / 10.0);
}

