function uuid
    head --bytes 16 /dev/random | basenc --base16 | tr '[:upper:]' '[:lower:]'
end
