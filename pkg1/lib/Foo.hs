module Foo where

-- hi

import Control.Concurrent.Async (Async)
import Data.Hashable (hash)

foo :: Async a -> Int
foo = hash
