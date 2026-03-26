// OS detection
function detectOS() {
  const ua = navigator.userAgent.toLowerCase();
  if (ua.includes('win')) return 'windows';
  if (ua.includes('mac')) return 'mac';
  if (ua.includes('linux') || ua.includes('x11')) return 'linux';
  return null;
}

// Highlight detected OS and pre-select
function init() {
  const detected = detectOS();
  const label = document.getElementById('os-detected');

  if (detected === 'windows') label.textContent = 'Windows';
  else if (detected === 'mac') label.textContent = 'Mac';
  else if (detected === 'linux') label.textContent = 'Linux';
  else label.textContent = 'unknown — please pick below';

  // Pre-select detected OS
  if (detected) {
    selectOS(detected);
  }

  // Button click handlers
  document.querySelectorAll('.os-btn').forEach(btn => {
    btn.addEventListener('click', () => selectOS(btn.dataset.os));
  });

  // Copy button handlers
  document.querySelectorAll('.copy-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      const text = btn.dataset.copy;
      navigator.clipboard.writeText(text).then(() => {
        btn.textContent = 'Copied!';
        btn.classList.add('copied');
        setTimeout(() => {
          btn.textContent = 'Copy';
          btn.classList.remove('copied');
        }, 2000);
      });
    });
  });
}

function selectOS(os) {
  // Update button states
  document.querySelectorAll('.os-btn').forEach(btn => {
    btn.classList.toggle('selected', btn.dataset.os === os);
  });

  // Show download section
  document.getElementById('download-section').classList.remove('hidden');

  // Show the right instructions
  document.querySelectorAll('.instructions').forEach(el => el.classList.add('hidden'));
  document.getElementById('instructions-' + os).classList.remove('hidden');

  // Smooth scroll to download section
  document.getElementById('download-section').scrollIntoView({ behavior: 'smooth', block: 'start' });
}

// Windows option tabs (safe vs quick)
function showWinOption(id) {
  document.querySelectorAll('.option-content').forEach(el => el.classList.add('hidden'));
  document.querySelectorAll('.option-tab').forEach(el => el.classList.remove('selected'));
  document.getElementById(id).classList.remove('hidden');
  document.querySelector('[data-option="' + id + '"]').classList.add('selected');
}
// Expose globally for inline onclick
window.showWinOption = showWinOption;

document.addEventListener('DOMContentLoaded', init);
