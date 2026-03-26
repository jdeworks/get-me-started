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
function showMacOption(id) {
  document.querySelectorAll('#instructions-mac .option-content').forEach(el => el.classList.add('hidden'));
  document.querySelectorAll('#instructions-mac .option-tab').forEach(el => el.classList.remove('selected'));
  document.getElementById(id).classList.remove('hidden');
  document.querySelector('#instructions-mac [data-option="' + id + '"]').classList.add('selected');
}

function showLinuxOption(id) {
  document.querySelectorAll('#instructions-linux .option-content').forEach(el => el.classList.add('hidden'));
  document.querySelectorAll('#instructions-linux .option-tab').forEach(el => el.classList.remove('selected'));
  document.getElementById(id).classList.remove('hidden');
  document.querySelector('#instructions-linux [data-option="' + id + '"]').classList.add('selected');
}

// Track user's choices for Step 3
var userOS = null;
var userInstall = null; // 'quick' or 'safe'

function updateStep3() {
  // Hide all dynamic next-step cards
  ['next-quick', 'next-safe-win', 'next-safe-unix', 'next-quick-unix', 'next-quick-win'].forEach(function(id) {
    var el = document.getElementById(id);
    if (el) el.classList.add('hidden');
  });

  if (!userOS || !userInstall) return;

  if (userInstall === 'quick') {
    var el = document.getElementById('next-quick');
    if (el) el.classList.remove('hidden');
    if (userOS === 'windows') {
      var w = document.getElementById('next-quick-win');
      if (w) w.classList.remove('hidden');
    } else {
      var u = document.getElementById('next-quick-unix');
      if (u) u.classList.remove('hidden');
    }
  } else if (userInstall === 'safe') {
    if (userOS === 'windows') {
      var el = document.getElementById('next-safe-win');
      if (el) el.classList.remove('hidden');
    } else {
      var el = document.getElementById('next-safe-unix');
      if (el) el.classList.remove('hidden');
    }
  }
}

// Override option tab functions to track install type
var _origShowWinOption = showWinOption;
showWinOption = function(id) {
  _origShowWinOption(id);
  userInstall = id.includes('safe') ? 'safe' : 'quick';
  updateStep3();
};

var _origShowMacOption = showMacOption;
showMacOption = function(id) {
  _origShowMacOption(id);
  userInstall = id.includes('safe') ? 'safe' : 'quick';
  updateStep3();
};

var _origShowLinuxOption = showLinuxOption;
showLinuxOption = function(id) {
  _origShowLinuxOption(id);
  userInstall = id.includes('safe') ? 'safe' : 'quick';
  updateStep3();
};

// Override selectOS to track OS choice
var _origSelectOS = selectOS;
selectOS = function(os) {
  userOS = os;
  // Set default install type based on OS
  if (os === 'windows') {
    userInstall = 'safe'; // Windows defaults to safe
  } else {
    userInstall = 'quick'; // Mac/Linux default to quick
  }
  _origSelectOS(os);
  updateStep3();
};

// Expose globally for inline onclick
window.showWinOption = showWinOption;
window.showMacOption = showMacOption;
window.showLinuxOption = showLinuxOption;

// Term tooltips — click to toggle on mobile, hover works on desktop
function initTerms() {
  document.querySelectorAll('.term').forEach(term => {
    term.addEventListener('click', (e) => {
      // Close all others first
      document.querySelectorAll('.term.open').forEach(t => {
        if (t !== term) t.classList.remove('open');
      });
      term.classList.toggle('open');
      e.stopPropagation();
    });
  });
  // Close tooltips when clicking elsewhere
  document.addEventListener('click', () => {
    document.querySelectorAll('.term.open').forEach(t => t.classList.remove('open'));
  });
}

// Experience level selector
function setLevel(level) {
  document.body.className = document.body.className
    .replace(/level-\w+/g, '')
    .trim();
  if (level !== 'guided') {
    document.body.classList.add('level-' + level);
  }
  document.querySelectorAll('.level-btn').forEach(btn => {
    btn.classList.toggle('selected', btn.dataset.level === level);
  });
  // Save preference
  try { localStorage.setItem('gms-level', level); } catch(e) {}
}
window.setLevel = setLevel;

function initLevel() {
  try {
    var saved = localStorage.getItem('gms-level');
    if (saved) { setLevel(saved); return; }
  } catch(e) {}
  setLevel('guided');
}

document.addEventListener('DOMContentLoaded', () => {
  init();
  initTerms();
  initLevel();
});
