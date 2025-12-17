import Foundation
import ArgumentParser
import Variables

struct ConvertCase: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "convert",
        abstract: "Convert identifiers between case styles",
        discussion: "Convert an array of symbols from one case style to another, with optional JSON output"
    )
    
    @Argument(
        help: "Identifiers to convert"
    )
    var inputs: [String]
    
    @Option(
        name: .shortAndLong,
        help: "Target case style: camel, snake, or pascal"
    )
    var style: ExpressibleCaseStyle = .snake
    
    @Option(
        name: .long,
        help: "Separator policy: commonWithDot, commonNoDot, or whitespaceOnly"
    )
    var separators: ExpressibleSeparatorPolicy = .commonWithDot
    
    @Flag(
        name: .long,
        help: "Output result as JSON: {ok: true, result: [...]}"
    )
    var json: Bool = false
    
    mutating func run() throws {
        guard !inputs.isEmpty else {
            let response = ConvertCaseResponse(error: "No inputs provided")
            if json {
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let data = try encoder.encode(response)
                if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                }
            } else {
                throw ValidationError("No inputs provided")
            }
            return
        }
        
        let converted = inputs.map { input in
            convertIdentifier(input, to: style.toCaseStyle(), separators: separators.toSeparatorPolicy())
        }
        
        if json {
            let response = ConvertCaseResponse(result: converted)
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(response)
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
        } else {
            converted.forEach { print($0) }
        }
    }
}
