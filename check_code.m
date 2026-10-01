% Run code analyser on all files in src and tests directory
code_issues = codeIssues( ...
    ["src", "tests"], ...
    CodeAnalyzerConfiguration = "codeAnalyzerConfiguration.json", ...
    IncludeSubfolders = true);
issues = code_issues.Issues;

% Write to GitHub summary file if running in GitHub Actions
gh_summary_env = getenv('GITHUB_STEP_SUMMARY');
if ~isempty(gh_summary_env)
    fid = fopen(gh_summary_env, "a");
    writeSummaryToFile(fid, issues);
    fclose(fid);
end

% Write to stdout
writeSummaryToFile(1, issues);

if ~isempty(issues)
    error("Code Analyser identified issues");
end

function writeSummaryToFile(fid, issues)
    % WRITESUMMARYTOFILE Write a codeIssues summary table to a file
    %   Takes the issues table, and if issues found, iterate over them and write to file
    arguments (Input)
        fid
        issues
    end

    fprintf(fid, "# MATLAB Code Analyser Results\n\n");
    if isempty(issues)
        fprintf(fid, "Code Analyser identified no issues\n");
        return
    end

    fprintf(fid, "| Severity | Filename | Line start | Column start | Description |\n");
    fprintf(fid, "|----------|----------|------------|--------------|-------------|\n");

    for i = 1:height(issues)
        issue = issues(i, :);
        fprintf(fid, "| %s | %s | %d | %d | %s |\n", ...
            issue.Severity, ...
            issue.FullFilename, ...
            issue.LineStart, ...
            issue.ColumnStart, ...
            issue.Description);
    end

    fprintf(fid, "\n");
end
