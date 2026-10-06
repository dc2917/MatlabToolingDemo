function plan = buildfile
    % BUILDFILE Define the build tasks
    import matlab.buildtool.Task
    import matlab.buildtool.tasks.*

    plan = buildplan();

    plan("clean") = CleanTask;
    plan("check") = Task( ...
        Description = "Run code issues", ...
        Actions = @(~)runCodeIssues);
    plan("test-unit") = TestTask( ...
        SourceFiles = "src", Tag = "Unit", ...
        TestResults = "test-results/results-unit.xml", ...
        CodeCoverageResults = "code-coverage/results.html");
    plan("test-regression") = TestTask( ...
        SourceFiles = "src", Tag = "Regression", ...
        TestResults = "test-results/results-regression.xml");

    plan.DefaultTasks = ["check" "test-unit"];
end

function runCodeIssues
    % RUNCODEISSUES Run codeIssues and write output

    % Run code analyser on all files in src and tests directory
    code_issues = codeIssues( ...
        ["src", "tests"], ...
        CodeAnalyzerConfiguration = "codeAnalyzerConfiguration.json", ...
        IncludeSubfolders = true);
    issues = code_issues.Issues;

    % Write to file
    if ~isfolder("code-issues")
        mkdir("code-issues");
    end
    fid = fopen("code-issues/results.md", "w");
    writeSummaryToFile(fid, issues);
    fclose(fid);

    % Write to stdout
    writeSummaryToFile(1, issues);

    if ~isempty(issues)
        errorStruct.message = 'Code Analyser identified issues.';
        errorStruct.identifier = 'runCodeIssues:issuesFound';
        error(errorStruct);
    end
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

    root_dir = fileparts(mfilename('fullpath'));
    for i = 1:height(issues)
        issue = issues(i, :);
        fprintf(fid, "| %s | %s | %d | %d | %s |\n", ...
            issue.Severity, ...
            issue.FullFilename.extractAfter(root_dir + "/"), ...
            issue.LineStart, ...
            issue.ColumnStart, ...
            issue.Description);
    end

    fprintf(fid, "\n");
end
