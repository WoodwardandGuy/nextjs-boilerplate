'use client';

import { classNames } from '@/utils/classNames';
import { SPACING } from '@/constants/theme';
import Container from './Container';

const Section = ({ 
  id, 
  background = 'white', 
  children, 
  className = '',
  size = 'default'
}) => {
  const backgrounds = {
    white: 'bg-white',
    gray: 'bg-gray-50',
    gradient: 'bg-gradient-to-br from-blue-50 to-indigo-100',
    dark: 'bg-gray-900 text-white'
  };

  const spacing = size === 'small' ? SPACING.sectionSmall : SPACING.section;
  
  return (
    <section 
      id={id} 
      className={classNames(backgrounds[background], spacing, className)}
    >
      <Container>
        {children}
      </Container>
    </section>
  );
};

export default Section;