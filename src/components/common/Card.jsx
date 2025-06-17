'use client';

import { classNames } from '@/utils/classNames';
import { SPACING } from '@/constants/theme';

const Card = ({ 
  variant = 'default', 
  children, 
  className = '',
  hover = true,
  ...props 
}) => {
  const variants = {
    default: 'bg-white rounded-xl shadow-md border border-gray-100',
    bordered: 'bg-white rounded-xl border-2 border-gray-200',
    gradient: 'bg-gradient-to-br from-blue-500 to-indigo-600 text-white rounded-xl shadow-lg',
    glass: 'bg-white/80 backdrop-blur-sm rounded-xl border border-white/20 shadow-lg'
  };

  const hoverEffects = hover ? 'hover:shadow-xl hover:-translate-y-1 transition-all duration-300' : '';
  
  return (
    <div 
      className={classNames(
        variants[variant], 
        SPACING.card, 
        hoverEffects,
        className
      )}
      {...props}
    >
      {children}
    </div>
  );
};

export default Card;