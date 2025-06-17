'use client';

import { FaLinkedin, FaTwitter, FaEnvelope, FaPhone } from 'react-icons/fa';
import { COMPANY } from '@/constants/content';
import { FOOTER_LINKS } from '@/constants/navigation';
import { formatPhone } from '@/utils/formatters';
import Container from '@/components/common/Container';

const Footer = () => {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-gray-900 text-white">
      <Container>
        <div className="py-16">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {/* Company Info */}
            <div className="lg:col-span-1">
              <h3 className="text-xl font-bold mb-4">{COMPANY.name}</h3>
              <p className="text-gray-300 mb-6">{COMPANY.description}</p>
              
              <div className="space-y-2">
                <a 
                  href={`tel:${COMPANY.phone}`}
                  className="flex items-center text-gray-300 hover:text-white transition-colors"
                >
                  <FaPhone className="mr-3" />
                  {formatPhone(COMPANY.phone)}
                </a>
                <a 
                  href={`mailto:${COMPANY.email}`}
                  className="flex items-center text-gray-300 hover:text-white transition-colors"
                >
                  <FaEnvelope className="mr-3" />
                  {COMPANY.email}
                </a>
              </div>
            </div>

            {/* Footer Links */}
            {Object.entries(FOOTER_LINKS).map(([key, section]) => (
              <div key={key}>
                <h4 className="text-lg font-semibold mb-4">{section.title}</h4>
                <ul className="space-y-2">
                  {section.links.map((link, index) => (
                    <li key={index}>
                      <a 
                        href={link.href}
                        className="text-gray-300 hover:text-white transition-colors"
                      >
                        {link.label}
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>

          {/* Social Links & Copyright */}
          <div className="border-t border-gray-800 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center">
            <div className="flex space-x-6 mb-4 md:mb-0">
              <a 
                href="#" 
                className="text-gray-400 hover:text-white transition-colors"
                aria-label="LinkedIn"
              >
                <FaLinkedin size={20} />
              </a>
              <a 
                href="#" 
                className="text-gray-400 hover:text-white transition-colors"
                aria-label="Twitter"
              >
                <FaTwitter size={20} />
              </a>
            </div>
            
            <p className="text-gray-400 text-sm">
              © {currentYear} {COMPANY.name}. All rights reserved.
            </p>
          </div>
        </div>
      </Container>
    </footer>
  );
};

export default Footer;