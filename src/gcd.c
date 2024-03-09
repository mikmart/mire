#define R_NO_REMAP
#include <Rinternals.h>

static double fgcd(double a, double b);

SEXP ffi_gcd(SEXP x) {
  double *xp = REAL(x);
  R_xlen_t n = Rf_length(x);
  if (n <= 0)
    return Rf_ScalarReal(NA_REAL);

  double res = fabs(xp[0]);
  for (R_xlen_t i = 1; i < n && res != 1; ++i)
    res = fgcd(res, xp[i]);

  return Rf_ScalarReal(res);
}

double fgcd(double a, double b) {
  if (a < b)
    return fgcd(b, a);

  double d;
  do {
    d = fmod(a, b);
    if (!R_FINITE(d))
      return fabs(d);
    a = b;
    b = d;
  } while (d);

  return fabs(a);
}
