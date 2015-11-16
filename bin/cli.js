#!/usr/bin/env node node --harmony

try {
    require('../dist')
} catch (err) {
    if (err.code !== 'MODULE_NOT_FOUND') {
        throw err
    }
    require('babel-core/register')({
        'presets': 'es2015',
        'sourceMaps': 'inline'
    });
    require('../src')
}
