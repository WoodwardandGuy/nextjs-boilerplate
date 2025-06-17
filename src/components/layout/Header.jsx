'use client';

import { useState } from 'react';
import { motion } from 'framer-motion';
import { FaBars, FaTimes } from 'react-icons/fa';
import { COMPANY } from '@/constants/content';
import { NAVIGATION_ITEMS } from '@/constants/navigation';
import { useScrollPosition } from '@/hooks/useScrollPosition';
import { classNames } from '@/utils/classNames';
import Container from '@/components/common/Container';
import Button from '@/components/common/Button';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const scrollPosition = useScrollPosition();
  const isScrolled = scrollPosition > 50;

  const toggleMenu = () => setIsMenuOpen(!isMenuOpen);

  return (
    <header className={classNames(
      'fixed top-0 left-0 right-0 z-50 transition-all duration-300',
      isScrolled 
        ? 'bg-white/95 backdrop-blur-sm shadow-lg' 
        : 'bg-transparent'
    )}>
      <Container>
        <div className="flex items-center justify-between h-16 lg:h-20">
          {/* Logo */}
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.5 }}
          >
            <a 
              href="#hero" 
              className={classNames(
                'text-xl lg:text-2xl font-bold transition-colors',
                isScrolled ? 'text-gray-900' : 'text-white'
              )}
            >
              {COMPANY.name}
            </a>
          </motion.div>

          {/* Desktop Navigation */}
          <nav className="hidden lg:flex items-center space-x-8">
            {NAVIGATION_ITEMS.map((item) => (
              <a
                key={item.id}
                href={item.href}
                className={classNames(
                  'font-medium transition-colors hover:text-blue-600',
                  isScrolled ? 'text-gray-700' : 'text-white'
                )}
              >
                {item.label}
              </a>
            ))}
            <Button 
              href="#contact" 
              variant="primary" 
              size="sm"
              className="ml-4"
            >
              Get Started
            </Button>
          </nav>

          {/* Mobile Menu Button */}
          <button
            onClick={toggleMenu}
            className={classNames(
              'lg:hidden p-2 rounded-md transition-colors',
              isScrolled ? 'text-gray-900' : 'text-white'
            )}
          >
            {isMenuOpen ? <FaTimes size={24} /> : <FaBars size={24} />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <motion.nav
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            className="lg:hidden bg-white border-t border-gray-200 py-4"
          >
            <div className="flex flex-col space-y-4">
              {NAVIGATION_ITEMS.map((item) => (
                <a
                  key={item.id}
                  href={item.href}
                  onClick={toggleMenu}
                  className="text-gray-700 font-medium hover:text-blue-600 transition-colors"
                >
                  {item.label}
                </a>
              ))}
              <Button 
                href="#contact" 
                variant="primary" 
                size="sm"
                className="self-start"
                onClick={toggleMenu}
              >
                Get Started
              </Button>
            </div>
          </motion.nav>
        )}
      </Container>
    </header>
  );
};

export default Header;