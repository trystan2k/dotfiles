import fs from 'fs';
import path from 'path';

export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'scope-enum': async () => {
      const srcDir = path.resolve(new URL('.', import.meta.url).pathname);
      const files = fs.readdirSync(srcDir, { withFileTypes: true });
      const subdirs = files.filter(file => {
        return file.isDirectory() && !file.name.startsWith('.') && file.name !== 'node_modules' && file.name !== 'dist' && file.name !== 'logs';
      }).map(dir => dir.name);
      return [2, 'always', [...subdirs, '*']];
    },
    'header-max-length': [2, 'always', 100],
  },
};
