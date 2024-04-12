/** @type {import('next').NextConfig} */
//const nextConfig = {};
const nextConfig = {
  reactStrictMode: true,
  images : {
    domains : ['localhost', 'images.unsplash.com', '127.0.0.1'] // == Domain name
  }
}
export default nextConfig;