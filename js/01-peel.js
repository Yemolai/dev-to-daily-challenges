const peel = val => typeof val !== 'string' || val.length < 2 ? null : val.slice(1, -1)
