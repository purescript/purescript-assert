export function assertImpl(message) {
  return (success) => () => {
    if (!success) throw new Error(message);
  };
}

export function checkThrows(fn) {
  return () => {
    try {
      fn();
      return false;
    } catch (e) {
      if (e instanceof Error) return true;
      const err = new Error("Threw something other than an Error");
      err.something = e;
      throw err;
    }
  };
}
