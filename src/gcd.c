#define R_NO_REMAP
#include <Rinternals.h>

int gcd(int a, int b) {
  return b ? gcd(b, a % b) : a;
}

SEXP ffi_gcd(SEXP x) {
  R_xlen_t n = Rf_length(x);

  int *xp = INTEGER(x);
  int res = NA_INTEGER;
  int any_missing = 0;

  for (R_xlen_t i = 0; i < n; ++i) {
    if (xp[i] == NA_INTEGER)
      any_missing = 1;
    else if (res == NA_INTEGER)
      res = xp[i];
    else if (res != 1)
      res = gcd(res, xp[i]);
    else
      break;
  }

  if (any_missing && res != 1)
    res = NA_INTEGER;

  return Rf_ScalarInteger(abs(res));
}
