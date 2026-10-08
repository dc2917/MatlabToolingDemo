classdef MaxEvenTest < matlab.unittest.TestCase
    % Unit tests for the maxEven function

    methods (TestClassSetup)

        function addSourceToPath(test_case)
            % Make the function under test available
            here = fileparts(mfilename('fullpath'));
            src_dir = fullfile(here, '..', 'src');
            test_case.applyFixture(matlab.unittest.fixtures.PathFixture(src_dir));
        end

    end

    methods (Test, TestTags = ["Unit"])

        function testPositiveInts(test_case)
            % Check maxEven works for positive integers
            actual = maxEven([1, 2, 3, 4, 5, 6]);
            expected = 6;

            test_case.verifyEqual(actual, expected);
        end

        function testNegativeInts(test_case)
            % Check maxEven works for negative integers
            actual = maxEven([-1, -2, -3, -4, -5, -6]);
            expected = -2;

            test_case.verifyEqual(actual, expected);
        end

        function testFloats(test_case)
            % Check maxEven for floating-point numbers
            actual = maxEven([-1.2, 3.4, -5.6, 7.8]);
            expected = double.empty(1, 0);

            test_case.verifyEqual(actual, expected);
        end

        function testEmpty(test_case)
            % Check maxEven for empty input
            actual = maxEven([]);
            expected = double.empty(0, 0);

            test_case.verifyEqual(actual, expected);
        end

    end
end
