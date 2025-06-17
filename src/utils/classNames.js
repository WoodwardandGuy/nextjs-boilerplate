export const classNames = (...classes) => {
  return classes.filter(Boolean).join(' ');
};

export const cn = classNames; // Shorter alias