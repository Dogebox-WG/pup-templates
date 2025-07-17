import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "NextJS Pup Template",
  description: "A template for building NextJS pups",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
