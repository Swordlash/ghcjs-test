module Main where

foreign import javascript unsafe "(() => { document.body.innerHTML = 'Hello, World!'; })()"
  hello :: IO ()

main :: IO ()
main = hello
