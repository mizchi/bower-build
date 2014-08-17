fs = require 'fs'
path = require 'path'

CWD = process.cwd()

p = (args...) ->
  console.log args...
  if args.length > 1 then args else args[0]

getLibBowers = (bowerFile, bowerPath, dependentType) ->
  for lib, ver of bowerFile[dependentType]
    libBower = require path.join CWD, "#{bowerPath}/#{lib}/.bower.json"
    override = bowerFile.overrides?[lib]
    if override?
      for k, v of override
        libBower[k] = v
    libBower

# unused yet
gatherDependencies = (libBowers) ->
  childDependentLibs = {}
  for bowerFile in libBowers
    dpc = bowerFile[target_dependent]
    for k, v of dpc
      ## use last one for develop
      # throw 'duplicated' if childDependencies[k]?
      childDependentLibs[k] = v
  childDependentLibs

getMainPaths = (libBowers, bowerPath) ->
  paths = []
  for libBower in libBowers
    {main, _originalSource} = libBower
    if typeof main is 'string'
      paths.push path.join CWD, "#{bowerPath}/#{_originalSource}/#{main}"
    else if main?.length
      for i in main
        paths.push path.join CWD, "#{bowerPath}/#{_originalSource}/#{i}"
  paths

loadAllFiles = (paths) ->
  for p in paths
    fs.readFileSync(p).toString()

module.exports = main = ({dev, out, prefix, debug}) ->
  mainBower = require path.join CWD, 'bower.json'

  bowerPath = 'bower_components'

  target_dependent = if dev then 'devDependencies' else 'dependencies'

  libBowers = getLibBowers(mainBower, bowerPath, target_dependent)
  paths = getMainPaths libBowers, bowerPath

  extnames = {}
  for p in paths
    ext = (path.extname p)
    if ext
      extnames[ext] = true

  for ext, v of extnames
    extPaths = paths.filter (p) -> path.extname(p) is ext
    outdir =
      if out
        path.join CWD, out,
      else
        CWD

    fname = (prefix or 'vendor') + ext
    dest = path.join outdir, fname

    result = (loadAllFiles extPaths).join('\n')

    fs.writeFileSync dest, result
    if debug
      console.log 'write:', dest
