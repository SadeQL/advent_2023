defmodule Day1.SolutionTest do
  use ExUnit.Case
  alias Day1.Solution

  describe "calculate_calibration_value" do
    setup do
      input_1 = [
        "threehqv2",
        "sxoneightoneckk9ldctxxnffqnzmjqvj",
        "1hggcqcstgpmg26lzxtltcgg"
      ]

      {:ok, input_1: input_1}
    end

    test "should give the correct value", %{input_1: input_1} do
      sum = Solution.calculate_calibration_value(input_1)
      expected_result = 137
      assert sum == expected_result
    end
  end

  describe "transform_string_to_digit" do
    test "with only one digit in a string should duplicated it and return a number" do
      input = "threehqv2"
      expected_result = 22
      result = Solution.transform_string_to_digit(input)
      assert result == expected_result
    end

    test "with 0 digit in a string should return 0" do
      input = "abcedes"
      assert Solution.transform_string_to_digit(input) == 0
    end

    test "with more than two digit in a string should take the first and last element and return a number" do
      input = "1hggcqcstgpmg26lzxtltcgg"
      expected_result = 16
      result = Solution.transform_string_to_digit(input)
      assert result == expected_result
    end

    test "with only digit in a string should still work" do
      input = "12345"
      expected_result = 15
      result = Solution.transform_string_to_digit(input)
      assert result == expected_result
    end
  end
end

defmodule Day1.Solution.Part2Test do
  use ExUnit.Case
  alias Day1.Solution.Part2

  describe "calculate_calibration_value" do
    setup do
      input_1 = [
        "threehqv2",
        "sxoneightoneckk9ldctxxnffqnzmjqvj",
        "1hggcqcstgpmg26lzxtltcgg"
      ]

      {:ok, input_1: input_1}
    end

    test "should give the correct value", %{input_1: input_1} do
      sum = Part2.calculate_calibration_value(input_1)

      # 32 + 19 + 16
      expected_result = 67
      assert sum == expected_result
    end
  end

  describe "transform_string_to_digit" do
    test "with only one digit in a string should duplicated it and return a number" do
      input = "threehqv2"
      expected_result = 32
      result = Part2.transform_string_to_digit(input)
      assert result == expected_result
    end

    test "with 0 digit in a string should return 0" do
      input = "abcedes"
      assert Part2.transform_string_to_digit(input) == 0
    end

    test "with more than two digit in a string should take the first and last element and return a number" do
      input = "1hggcqcstgpmg26lzxtltcgg"
      expected_result = 16
      result = Part2.transform_string_to_digit(input)
      assert result == expected_result
    end

    test "with only digit in a string should still work" do
      input = "12345"
      expected_result = 15
      result = Part2.transform_string_to_digit(input)
      assert result == expected_result
    end

    test "with edge case input should work correctly" do
      input = "xtwone3four"
      expected_output = 24
      result = Part2.transform_string_to_digit(input)
      assert result == expected_output
    end
  end
end
