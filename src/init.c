#define R_NO_REMAP
#include <Rinternals.h>

extern SEXP ffi_let(SEXP, SEXP, SEXP, SEXP);

static const R_ExternalMethodDef ExternalMethods[] = {
  {"ffi_let", (DL_FUNC) &ffi_let, 2},
  {NULL, NULL, 0}
};

void R_init_mire(DllInfo *info) {
  R_registerRoutines(info, NULL, NULL, NULL, ExternalMethods);
  R_useDynamicSymbols(info, FALSE);
}
