#define R_NO_REMAP
#include <Rinternals.h>

// .Call
extern SEXP ffi_gcd(SEXP);

static const R_CallMethodDef CallMethods[] = {
  {"ffi_gcd", (DL_FUNC) &ffi_gcd, 1},
  {NULL, NULL, 0}
};

// .External
extern SEXP ffi_let(SEXP, SEXP, SEXP, SEXP);

static const R_ExternalMethodDef ExternalMethods[] = {
  {"ffi_let", (DL_FUNC) &ffi_let, 0},
  {NULL, NULL, 0}
};

SEXP R_ExprSymbol = NULL;

void R_init_mire(DllInfo *info) {
  R_registerRoutines(info, NULL, CallMethods, NULL, ExternalMethods);
  R_useDynamicSymbols(info, FALSE);
  R_ExprSymbol = Rf_install("expr");
}
