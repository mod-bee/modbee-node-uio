let ws = null;

function initWebSocket() {
  ws = new WebSocket('ws://' + window.location.host + '/ws');
  ws.onopen = () => console.log('WebSocket connected');
  ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    updateUI(data);
  };
  ws.onclose = () => {
    console.log('WebSocket disconnected');
    setTimeout(initWebSocket, 5000);
  };
}

function updateUI(data) {
  // Network status
  document.getElementById('network-mode').textContent = data.network.mode;
  document.getElementById('network-ssid').textContent = data.network.ssid;
  document.getElementById('network-ip').textContent = data.network.ip;

  // I/O status
  for (let i = 1; i <= 8; i++) {
    document.getElementById(`di0${i}`).textContent = data.io.di[i-1];
    document.getElementById(`do0${i}`).textContent = data.io.do[i-1];
  }
  for (let i = 1; i <= 4; i++) {
    document.getElementById(`ai0${i}`).textContent = data.io.ai_scaled[i-1];
  }
  for (let i = 1; i <= 2; i++) {
    document.getElementById(`ao0${i}`).textContent = data.io.ao_scaled[i-1];
  }

  // Calibration
  for (let i = 0; i < 4; i++) {
    document.getElementById(`adc_zero_${i}`).value = data.calibration.adc_zero_offsets[i];
    document.getElementById(`adc_low_${i}`).value = data.calibration.adc_low[i];
    document.getElementById(`adc_high_${i}`).value = data.calibration.adc_high[i];
  }
  for (let i = 0; i < 2; i++) {
    document.getElementById(`dac_zero_${i}`).value = data.calibration.dac_zero_offsets[i];
    document.getElementById(`dac_low_${i}`).value = data.calibration.dac_low[i];
    document.getElementById(`dac_high_${i}`).value = data.calibration.dac_high[i];
  }
}

function saveCalibration() {
  const calibration = {
    adc_zero_offsets: [],
    adc_low: [],
    adc_high: [],
    dac_zero_offsets: [],
    dac_low: [],
    dac_high: []
  };
  for (let i = 0; i < 4; i++) {
    calibration.adc_zero_offsets.push(parseInt(document.getElementById(`adc_zero_${i}`).value));
    calibration.adc_low.push(parseInt(document.getElementById(`adc_low_${i}`).value));
    calibration.adc_high.push(parseInt(document.getElementById(`adc_high_${i}`).value));
  }
  for (let i = 0; i < 2; i++) {
    calibration.dac_zero_offsets.push(parseInt(document.getElementById(`dac_zero_${i}`).value));
    calibration.dac_low.push(parseInt(document.getElementById(`dac_low_${i}`).value));
    calibration.dac_high.push(parseInt(document.getElementById(`dac_high_${i}`).value));
  }
  ws.send(JSON.stringify({ calibration }));
}

document.getElementById('wifi-form').addEventListener('submit', (e) => {
  e.preventDefault();
  const ssid = document.getElementById('ssid').value;
  const password = document.getElementById('password').value;
  fetch('/wifi', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `ssid=${encodeURIComponent(ssid)}&password=${encodeURIComponent(password)}`
  })
    .then(response => response.json())
    .then(data => {
      document.getElementById('wifi-status').textContent = data.status || data.error;
    })
    .catch(error => {
      document.getElementById('wifi-status').textContent = 'Error connecting to Wi-Fi';
    });
});

initWebSocket();