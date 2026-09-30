code_issues = codeIssues( ...
    ["src", "tests"], ...
    CodeAnalyzerConfiguration = "codeAnalyzerConfiguration.json", ...
    IncludeSubfolders = true);

gh_summary_env = getenv('GITHUB_STEP_SUMMARY');
if ~isempty(gh_summary_env)
    summary_file = gh_summary_env;
    fid = fopen(summary_file, "a");
else
    summary_file = "code_issues.md";
    fid = fopen(summary_file, "w");
end

fprintf(fid, "# MATLAB Code Analyser Results\n\n");

if ~isempty(code_issues.Issues)
    disp(code_issues.Issues(:, [2, 10, 6, 8, 4]));

    fprintf(fid, "| Severity | Filename | Line start | Column start | Description |\n");
    fprintf(fid, "|----------|----------|------------|--------------|-------------|\n");

    for i = 1:height(code_issues.Issues)
        issue = code_issues.Issues(i, :);
        fprintf(fid, "| %s | %s | %d | %d | %s |\n", ...
            issue.Severity, ...
            issue.FullFilename, ...
            issue.LineStart, ...
            issue.ColumnStart, ...
            issue.Description);
    end

    fprintf(fid, "\n");
    fclose(fid);

    error("Code Analyser identified issues");
else
    fprintf(fid, "Code Analyser identified no issues");
    fprintf(fid, "\n");
    fclose(fid);

    disp("Code Analyser identified no issues");
end
