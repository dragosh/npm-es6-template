#!/usr/bin/env node --harmony

try {
    require('../dist/cli')
} catch (err) {
    if (err.code !== 'MODULE_NOT_FOUND') {
        throw err
    }
    require('babel-core/register')({
        'presets': 'es2015',
        'sourceMaps': 'inline'
    });
    require('../src/cli')
}
