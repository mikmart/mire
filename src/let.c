#define R_NO_REMAP
#include <Rinternals.h>

extern SEXP R_ExprSymbol; // = Rf_install("expr") on load
static Rboolean all_nodes_in_pairlist_have_tags(SEXP);

SEXP ffi_let(SEXP call, SEXP op, SEXP args, SEXP rho) {
  SEXP expr = Rf_findVarInFrame(rho, R_ExprSymbol);
  SEXP dots = Rf_findVarInFrame(rho, R_DotsSymbol);

  if (expr == R_MissingArg)
    return R_NilValue;
  if (dots == R_MissingArg)
    return Rf_eval(PRCODE(expr), PRENV(expr));
  if (!all_nodes_in_pairlist_have_tags(dots))
    Rf_error("All arguments in `...` must be named.");

  SEXP env = PROTECT(R_NewEnv(PRENV(expr), 0, 0));
  for (SEXP cons = dots; cons != R_NilValue; cons = CDR(cons))
    Rf_defineVar(TAG(cons), Rf_eval(PRCODE(CAR(cons)), env), env);

  UNPROTECT(1);
  return Rf_eval(PRCODE(expr), env);
}

Rboolean all_nodes_in_pairlist_have_tags(SEXP x) {
  for (; x != R_NilValue; x = CDR(x))
    if (TAG(x) == R_NilValue) return FALSE;
  return TRUE;
}
