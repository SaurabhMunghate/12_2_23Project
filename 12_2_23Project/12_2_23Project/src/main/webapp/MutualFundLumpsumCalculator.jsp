<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Saurabh</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    
    .container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
    }
    
    h1 {
      text-align: center;
    }
    
    label {
      display: block;
      margin-bottom: 10px;
    }
    
    input[type="text"],
    input[type="range"] {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
    }
    
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin-top: 10px;
      cursor: pointer;
    }
    
    .result {
      margin-top: 20px;
      border: 1px solid #ccc;
      padding: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Mutual Fund Lumpsum Calculator</h1>
    
    <form id="calculatorForm">
      <label for="investmentAmount">Investment Amount:</label>
      <input type="text" id="investmentAmount" placeholder="Enter the investment amount" required>
      <input type="range" id="investmentAmountRange" min="0" max="1000000" step="1000" value="0">
      
      <label for="returnRate">Annual Return Rate (%):</label>
      <input type="text" id="returnRate" placeholder="Enter the annual return rate" required>
      <input type="range" id="returnRateRange" min="0" max="200" step="0.5" value="0">
      
      <label for="investmentPeriod">Investment Period (in years):</label>
      <input type="text" id="investmentPeriod" placeholder="Enter the investment period" required>
      <input type="range" id="investmentPeriodRange" min="0" max="50" step="1" value="0">
      
      <input type="submit" value="Calculate">
    </form>
    
    <div class="result" id="resultSection" style="display: none;">
      <h2>Results:</h2>
      <p id="futureValue"></p>
    </div>
  </div>
  
  <script>
    function calculateFutureValue() {
      // Retrieve user inputs
      var investmentAmount = parseFloat(document.getElementById('investmentAmount').value);
      var returnRate = parseFloat(document.getElementById('returnRate').value);
      var investmentPeriod = parseInt(document.getElementById('investmentPeriod').value);
      
      // Calculate future value
      var futureValue = investmentAmount * Math.pow(1 + (returnRate / 100), investmentPeriod);
      
      // Display the result
      document.getElementById('futureValue').innerHTML = "The future value of your investment is: " + futureValue.toFixed(2);
      document.getElementById('resultSection').style.display = 'block';
    }
    
    document.getElementById('calculatorForm').addEventListener('submit', function(e) {
      e.preventDefault(); // Prevent form submission
      calculateFutureValue();
    });
    
    // Update input fields and calculate result when sliders change
    document.getElementById('investmentAmountRange').addEventListener('input', function() {
      document.getElementById('investmentAmount').value = this.value;
      calculateFutureValue();
    });
    
    document.getElementById('returnRateRange').addEventListener('input', function() {
      document.getElementById('returnRate').value = this.value;
      calculateFutureValue();
    });
    
    document.getElementById('investmentPeriodRange').addEventListener('input', function() {
      document.getElementById('investmentPeriod').value = this.value;
      calculateFutureValue();
    });
  </script>
</body>
</html>
