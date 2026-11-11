if (!ProcIdExists(procId)) {
  str = "No environment to iterate.";
  show_message(str);
  exit;
}
info = ProcInfoFromProcIdEx(procId, KINFO_ENVV);
envsize = EnvironmentLength(info);
if (envsize) {
  for (jj = 0; jj < envsize; jj += 1) {
    str = "Continue environment iteration?" + chr(13) + chr(10) + chr(13) + chr(10) + Environment(info, jj);
    q = show_question(str);
    if (!q) { FreeProcInfo(info); exit; } 
  }
} else {
  str = "No environment to iterate.";
  show_message(str);
}
FreeProcInfo(info);
