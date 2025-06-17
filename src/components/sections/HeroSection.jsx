'use client';

import { motion } from 'framer-motion';
import { FaArrowRight } from 'react-icons/fa';
import { HERO_CONTENT, COMPANY } from '@/constants/content';
import { ANIMATIONS } from '@/constants/theme';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Button from '@/components/common/Button';

const HeroSection = () => {
  return (
    <Section 
      id="hero" 
      background="gradient" 
      className="min-h-screen flex items-center bg-gradient-to-br from-blue-900 via-blue-800 to-indigo-900 text-white relative overflow-hidden"
    >
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-10">
        <div className="absolute inset-0 bg-[url('data:image/svg+xml,%3Csvg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cg fill="%23ffffff" fill-opacity="0.1"%3E%3Ccircle cx="30" cy="30" r="2"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E')]"></div>
      </div>

      <div className="relative z-10 text-center max-w-4xl mx-auto">
        <motion.div {...ANIMATIONS.stagger}>
          <motion.div {...ANIMATIONS.fadeInUp}>
            <Heading level={1} color="white" align="center" className="mb-6">
              {HERO_CONTENT.heading}
            </Heading>
          </motion.div>

          <motion.p 
            {...ANIMATIONS.fadeInUp}
            className="text-xl lg:text-2xl text-blue-100 mb-8 max-w-3xl mx-auto leading-relaxed"
          >
            {HERO_CONTENT.subheading}
          </motion.p>

          <motion.div 
            {...ANIMATIONS.fadeInUp}
            className="flex flex-col sm:flex-row gap-4 justify-center items-center"
          >
            <Button 
              href={HERO_CONTENT.primaryCTA.href}
              variant="primary"
              size="lg"
              className="bg-white text-blue-900 hover:bg-gray-100 shadow-xl"
            >
              {HERO_CONTENT.primaryCTA.text}
              <FaArrowRight className="ml-2" />
            </Button>
            
            <Button 
              href={HERO_CONTENT.secondaryCTA.href}
              variant="outline"
              size="lg"
              className="border-white text-white hover:bg-white hover:text-blue-900"
            >
              {HERO_CONTENT.secondaryCTA.text}
            </Button>
          </motion.div>

          <motion.div 
            {...ANIMATIONS.fadeInUp}
            className="mt-12 text-blue-200"
          >
            <p className="text-sm">
              Trusted by 50+ businesses • Average 40% growth increase
            </p>
          </motion.div>
        </motion.div>
      </div>

      {/* Scroll Indicator */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1, duration: 1 }}
        className="absolute bottom-8 left-1/2 transform -translate-x-1/2"
      >
        <motion.div
          animate={{ y: [0, 10, 0] }}
          transition={{ duration: 2, repeat: Infinity }}
          className="w-6 h-10 border-2 border-white rounded-full flex justify-center"
        >
          <div className="w-1 h-3 bg-white rounded-full mt-2"></div>
        </motion.div>
      </motion.div>
    </Section>
  );
};

export default HeroSection;