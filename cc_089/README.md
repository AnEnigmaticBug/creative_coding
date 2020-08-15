This is the simulation of a [Langton's ant](https://en.wikipedia.org/wiki/Langton's_ant). It has a walker(called the 'ant') which follows 3 simple rules:
* If the tile the ant is on is yellow, the ant should turn right
* If the tile the ant is on is purple, the ant should turn left
* Once the ant passes over a tile, it flips its color

These simple 3 rules can lead to seemingly complex behavior(though over long times). This is an accurate simulation since it uses a finite-grid which wraps around at the edges.
