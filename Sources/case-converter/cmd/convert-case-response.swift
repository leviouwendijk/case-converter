struct ConvertCaseResponse: Codable {
    let ok: Bool
    let result: [String]?
    let error: String?
    
    init(result: [String]) {
        self.ok = true
        self.result = result
        self.error = nil
    }
    
    init(error: String) {
        self.ok = false
        self.result = nil
        self.error = error
    }
}
