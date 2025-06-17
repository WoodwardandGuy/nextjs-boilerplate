'use client';

import { classNames } from '@/utils/classNames';
import { TYPOGRAPHY } from '@/constants/theme';

const Heading = ({ 
  level = 2, 
  children, 
  className = '',
  align = 'left',
  color = 'default'
}) => {
  const Tag = `h${level}`;
  
  const alignments = {
    left: 'text-left',
    center: 'text-center',
    right: 'text-right'
  };

  const colors = {
    default: 'text-gray-900',
    white: 'text-white',
    blue: 'text-blue-600',
    gray: 'text-gray-600'
  };

  const typography = {
    1: TYPOGRAPHY.h1,
    2: TYPOGRAPHY.h2,
    3: TYPOGRAPHY.h3,
    4: TYPOGRAPHY.h4
  };
  
  return (
    <Tag className={classNames(
      typography[level], 
      alignments[align],
      colors[color],
      className
    )}>
      {children}
    </Tag>
  );
};

export default Heading;