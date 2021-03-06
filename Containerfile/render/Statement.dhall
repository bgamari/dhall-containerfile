let Prelude = ../../Prelude.dhall

let Statement = { Type = ../Statement.dhall }

let prefixText = \(prefix : Text) -> \(text : Text) -> "${prefix} ${text}"

let prefixTextList =
      \(prefix : Text) ->
      \(list : List Text) ->
        "${prefix} " ++ ./textList.dhall list

let renderStatement =
      \(statement : Statement.Type) ->
        merge
          { From = prefixText "FROM"
          , Comment = prefixText "#"
          , Workdir = prefixText "WORKDIR"
          , Run = prefixText "RUN"
          , User = prefixText "USER"
          , Cmd = prefixTextList "CMD"
          , Exec = prefixTextList "RUN"
          , Expose = prefixText "EXPOSE"
          , Add = prefixTextList "ADD"
          , Copy = prefixTextList "COPY"
          , Volume = prefixTextList "VOLUME"
          , Entrypoint = prefixTextList "ENTRYPOINT"
          , Env = ./Env.dhall
          , Label = ./Label.dhall
          , Arg = ./prefixMapText.dhall "ARG"
          , Shell = prefixTextList "SHELL"
          , Empty = ""
          }
          statement

in  renderStatement
