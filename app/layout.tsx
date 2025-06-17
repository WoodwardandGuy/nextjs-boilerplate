import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Woodward & Guy - Strategic Growth. Built on Data. Driven by Results.",
  description: "Woodward & Guy delivers tailored solutions that align strategy, data, and execution. Transform your business with our proven consulting approach.",
  keywords: "business consulting, strategic growth, data analytics, business strategy, marketing optimization, growth acceleration",
  authors: [{ name: "Woodward & Guy" }],
  creator: "Woodward & Guy",
  publisher: "Woodward & Guy",
  robots: "index, follow",
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://woodwardandguy.com",
    title: "Woodward & Guy - Strategic Growth. Built on Data. Driven by Results.",
    description: "Woodward & Guy delivers tailored solutions that align strategy, data, and execution.",
    siteName: "Woodward & Guy",
  },
  twitter: {
    card: "summary_large_image",
    title: "Woodward & Guy - Strategic Growth. Built on Data. Driven by Results.",
    description: "Woodward & Guy delivers tailored solutions that align strategy, data, and execution.",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        {children}
      </body>
    </html>
  );
}