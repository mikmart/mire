#define R_NO_REMAP
#include <Rinternals.h>

Rboolean is_pairlist_all_named(SEXP x) {
  for (; !Rf_isNull(x); x = CDR(x))
    if (Rf_isNull(TAG(x))) return FALSE;
  return TRUE;
}

SEXP ffi_let(SEXP call, SEXP op, SEXP args, SEXP rho) {
  SEXP expr = CADR(args);
  SEXP env = CADDR(args);
  SEXP dots = Rf_findVar(R_DotsSymbol, rho);

  if (dots != R_MissingArg) {
    if (!is_pairlist_all_named(dots))
      Rf_error("All arguments in `...` must be named.");
    env = R_NewEnv(env, 1, Rf_length(dots));
    for (SEXP cons = dots; !Rf_isNull(cons); cons = CDR(cons))
      Rf_defineVar(TAG(cons), Rf_eval(R_PromiseExpr(CAR(cons)), env), env);
  }

  return Rf_eval(expr, env);
}
