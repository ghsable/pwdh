-- SPDX-License-Identifier: BSD-3-Clause

module Lib (getPutStr, getOption, getArgs') where

import System.Environment (getArgs)            -- base
import System.Directory (getCurrentDirectory)  -- directory

getPutStr :: (Int, String) -> IO String
getPutStr (len, opt)
  | len == 0              = getCurrentDirectory
  | len == 2              = return "pwdh: too many arguments"
  | opt `elem` ["-L", "--logical"]  = return $ "pwdh: no such option: " ++ opt
  | opt `elem` ["-P", "--physical"] = getCurrentDirectory
  | opt == "--help"       = return "Print the full filename of the current working directory.\n\
                                   \\n\
                                   \-P, --physical  avoid all symlinks\n\
                                   \\n\
                                   \    --help      display this help and exit\n\
                                   \\n\
                                   \    --version   output version information and exit\n\
                                   \\n\
                                   \If no option is specified, -P is assumed.\n"
  | opt == "--version"    = return "pwdh 0.2.1.1 created by dativus"
  | otherwise             = return $ "pwdh: bad option: " ++ opt

getOption :: [String] -> IO (Int, String)
getOption args
  | null args     = return (0, "")
  | [opt] <- args = return (1, opt)
  | otherwise     = return (2, "")

getArgs' :: IO [String]
getArgs' = getArgs
