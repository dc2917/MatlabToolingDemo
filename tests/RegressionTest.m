classdef RegressionTest < matlab.unittest.TestCase
    % REGRESSIONTEST Regression tests for the codebase

    methods (TestClassSetup)

        function addSourceToPath(test_case)
            % ADDSOURCETOPATH Make the function under test available
            here = fileparts(mfilename('fullpath'));
            src_dir = fullfile(here, '..', 'src');
            test_case.applyFixture(matlab.unittest.fixtures.PathFixture(src_dir));
        end

    end

    methods (Test, TestTags = ["Regression"])

        function testRegression(test_case)
            % TESTREGRESSION Test the entire data processing pipeline
            %   Check results against known result
            known_result = 100;

            test_data = 1:100;

            % Run the full pipeline
            max_even_num = maxEven(test_data);

            result = max_even_num;
            test_case.verifyEqual(result, known_result);
        end

    end

end
