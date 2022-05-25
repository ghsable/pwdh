-- SPDX-License-Identifier: BSD-3-Clause

module Src.LibSpec (spec) where

import qualified Lib (getPutStr, getOption, getArgs')

import Test.Hspec                              -- hspec
import System.Directory (setCurrentDirectory)  -- directory

spec :: Spec
spec = do
  describe "src/Lib.hs" $ do
    it "getPutStr :: (Int, String) -> IO String" $ do
      setCurrentDirectory "/home"

      a <- Lib.getPutStr (0, "")
      a `shouldBe` "/home"

      b <- Lib.getPutStr (1, "-L")
      b `shouldBe` "pwdh: no such option: -L"

      c <- Lib.getPutStr (1, "--logical")
      c `shouldBe` "pwdh: no such option: --logical"

      d <- Lib.getPutStr (1, "-P")
      d `shouldBe` "/home"

      e <- Lib.getPutStr (1, "--physical")
      e `shouldBe` "/home"

      f <- Lib.getPutStr (1, "--help")
      f `shouldBe` "Print the full filename of the current working directory.\n\n-P, --physical  avoid all symlinks\n\n    --help      display this help and exit\n\n    --version   output version information and exit\n\nIf no option is specified, -P is assumed.\n"

      g <- Lib.getPutStr (1, "--version")
      g `shouldBe` "pwdh 0.2.0.0 created by dativus"

      h <- Lib.getPutStr (1, "-Z")
      h `shouldBe` "pwdh: bad option: -Z"

      i <- Lib.getPutStr (2, "-P")
      i `shouldBe` "pwdh: too many arguments"

    it "getOption :: [String] -> IO (Int, String)" $ do
      a <- Lib.getOption []
      a `shouldBe` (0, "")

      b <- Lib.getOption ["-P"]
      b `shouldBe` (1, "-P")

      c <- Lib.getOption ["-L", "-P"]
      c `shouldBe` (2, "too-many-arguments")

    it "getArgs' :: IO [String]" $ do
      a <- Lib.getArgs'
      a `shouldBe` []
