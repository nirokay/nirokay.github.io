const
    imgDir: string = "./resources/img/"
    imgDirLang: string = imgDir & "lang/"

# Images
const
    imagelink*: tuple[github, cohost, discord, randomCat: string] = (
        github: imgDir & "github.svg",
        cohost: imgDir & "cohost.svg",
        discord: imgDir & "discord-mark-white.svg",
        randomCat: "https://api.thecatapi.com/v1/images/search?format=src&size=full"
    )

type ProgrammingLanguage* = enum
    Nim = imgDirLang & "nim.png"
    Lua = imgDirLang & "lua.png"
