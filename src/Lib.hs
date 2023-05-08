-- SPDX-License-Identifier: BSD-3-Clause

module Lib (getPutStr, getOption, getArgs') where

import System.Environment (getArgs)            -- base
import System.Directory (getCurrentDirectory)  -- directory

getPutStr :: (Int, String) -> IO String
getPutStr (len, opt) =
  case (len, opt) of
    (0, _)            -> getCurrentDirectory
    (1, "-L")         -> return $ "pwdh: no such option: " ++ opt
    (1, "--logical")  -> return $ "pwdh: no such option: " ++ opt
    (1, "-P")         -> getCurrentDirectory
    (1, "--physical") -> getCurrentDirectory
    (1, "--help")     -> return "Print the full filename of the current working directory.\n\
                                 \\n\
                                 \-P, --physical  avoid all symlinks\n\
                                 \\n\
                                 \    --help      display this help and exit\n\
                                 \\n\
                                 \    --version   output version information and exit\n\
                                 \\n\
                                 \If no option is specified, -P is assumed.\n"
    (1, "--version")  -> return "pwdh 0.3.0.0 created by dativus"
    (1, _)            -> return $ "pwdh: bad option: " ++ opt
    _                 -> return "pwdh: too many arguments"

getOption :: [String] -> IO (Int, String)
getOption []      = return (0, "")
getOption [opt]   = return (1, opt)
getOption (_:_:_) = return (2, "too-many-arguments")

getArgs' :: IO [String]
getArgs' = getArgs
