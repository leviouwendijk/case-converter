import ArgumentParser
import Variables

enum ExpressibleCaseStyle: String, RawRepresentable, ExpressibleByArgument {
    case camel     
    case snake     
    case pascal    

    func toCaseStyle() -> CaseStyle {
        switch self {
        case .camel:
            return .camel
        case .snake:
            return .snake
        case .pascal:
            return .pascal
        }
    }
}

enum ExpressibleSeparatorPolicy: String, RawRepresentable, ExpressibleByArgument {
    case commonWithDot
    case commonNoDot     
    case whitespaceOnly  

    func toSeparatorPolicy() -> SeparatorPolicy {
        switch self {
        case .commonWithDot:
            return .commonWithDot
        case .commonNoDot:
            return .commonNoDot
        case .whitespaceOnly:
            return .whitespaceOnly
        }
    }
}
