code_issues = codeIssues(...
    ["src", "tests"], ...
    CodeAnalyzerConfiguration="codeAnalyzerConfiguration.json", ...
    IncludeSubfolders=true);

if ~isempty(code_issues.Issues)
    disp(code_issues.Issues(:,[2,10,6,8,4]));
    error("Code Analyser identified issues");
else
    disp("Code Analyser identified no issues");
end
