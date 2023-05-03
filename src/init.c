#define R_NO_REMAP
#include <Rinternals.h>

extern SEXP ffi_let(SEXP, SEXP, SEXP, SEXP);

static const R_ExternalMethodDef ExternalMethods[] = {
  {"ffi_let", (DL_FUNC) &ffi_let, 0},
  {NULL, NULL, 0}
};

SEXP R_ExprSymbol = NULL;

void R_init_mire(DllInfo *info) {
  R_registerRoutines(info, NULL, NULL, NULL, ExternalMethods);
  R_useDynamicSymbols(info, FALSE);
  R_ExprSymbol = Rf_install("expr");
}
