'use client';

import { classNames } from '@/utils/classNames';
import { SPACING } from '@/constants/theme';

const Container = ({ children, className = '', size = 'default' }) => {
  const sizes = {
    default: SPACING.container,
    narrow: 'max-w-4xl mx-auto px-4 sm:px-6 lg:px-8',
    wide: 'max-w-8xl mx-auto px-4 sm:px-6 lg:px-8'
  };

  return (
    <div className={classNames(sizes[size], className)}>
      {children}
    </div>
  );
};

export default Container;