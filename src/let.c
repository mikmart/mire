#define R_NO_REMAP
#include <Rinternals.h>

extern SEXP R_ExprSymbol;

Rboolean is_pairlist_all_named(SEXP x) {
  for (; x != R_NilValue; x = CDR(x))
    if (TAG(x) == R_NilValue) return FALSE;
  return TRUE;
}

SEXP ffi_let(SEXP call, SEXP op, SEXP args, SEXP rho) {
  SEXP expr = Rf_findVar(R_ExprSymbol, rho);
  SEXP dots = Rf_findVar(R_DotsSymbol, rho);

  if (expr == R_MissingArg)
    return R_NilValue;
  if (dots == R_MissingArg)
    return Rf_eval(PREXPR(expr), PRENV(expr));
  if (!is_pairlist_all_named(dots))
    Rf_error("All arguments in `...` must be named.");

  SEXP env = PROTECT(R_NewEnv(PRENV(expr), 0, 0));
  for (SEXP cons = dots; cons != R_NilValue; cons = CDR(cons))
    Rf_defineVar(TAG(cons), Rf_eval(PREXPR(CAR(cons)), env), env);

  UNPROTECT(1);
  return Rf_eval(PREXPR(expr), env);
}
