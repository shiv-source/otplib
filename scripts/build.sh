echo "\n--- packing modules ---"
npm run build:modules

echo "\n--- transpile modules ---"
npx babel \
  dist/otplib \
  -d dist/otplib

echo "\n--- packing bundles ---"
NODE_ENV=production npm run build:bundles

echo "--- copying meta ---"
cp ./README.md ./dist/otplib/README.md
cp ./LICENSE ./dist/otplib/LICENSE
cp ./package.json ./dist/otplib/package.json
cp ./.npmignore ./dist/otplib/.npmignore

echo "--- adding type definitions ---"
cp ./packages/types-ts/index.d.ts ./dist/otplib/index.d.ts

