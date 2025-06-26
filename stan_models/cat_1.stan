
// The things we observe...
data {
  int N;  // number of cats
  array[N] int adopted;  // indicator: 1 = adopted, 0 = not adopted
  array[N] int<lower=0> days;  // days until event
  array[N] int colour;  // 1 = black, 2 = other
}
// The things we don't observe but want to know...
parameters {
  vector<lower=0, upper=1>[2] p;  // probabilities of adoption for black vs other cats
}
// The model that relates these things...
model {
  // Sample probabilities from a beta prior distribution.
  //
  // Note: Richard McElreath's original code used a beta(1,10) prior but after
  // having problems with some sampling chains failing I changed this to a 
  // more gentle beta(1,5) prior. Not sure what the problem was.
  //
  target += beta_lpdf(p|1,5);
  
  // The above line could also be coded as: p ~ beta(1, 5);

  // Model cat adoptions
  for (i in 1:N) {
    real P = p[colour[i]];
    if (adopted[i] == 1) {
      // The contribution to log-likelihood.
      // Note: both `target +=` and `target ~` syntaxes can be used here to
      // progressively add to the target
      target += log(P * (1-P)^(days[i] - 1));
      
    } else {
      // === Something else goes here later ===
      // We don't need this bit yet because all cats in the simulated data
      // are adopted eventually.
    }
  }
}

