import ArgumentParser

struct CaseConverterApp: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "casecon",
        discussion: "Case conversion CLI with JSON API",
        subcommands: [
            ConvertCase.self
        ],
        defaultSubcommand: ConvertCase.self
    )
}
