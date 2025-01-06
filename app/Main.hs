module Main where

foreign import javascript unsafe "(() => { document.body.innerHTML = `Hello, ${world}!`; })()"
  hello :: IO ()

main :: IO ()
main = hello
