<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Простая страница</title>
  <style>
    :root{
      --bg:#0b0b0f;
      --glow:#ff2d95;
      --text:#ffffff;
      --glass: rgba(255,255,255,0.03);
    }
    html,body{height:100%;margin:0;font-family:Inter, Roboto, "Helvetica Neue", Arial, sans-serif;background:linear-gradient(135deg,#05050a 0%, #0f0f16 100%);display:flex;align-items:center;justify-content:center}
    .card{width:min(900px,92%);padding:clamp(24px,6vw,48px);border-radius:16px;background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));box-shadow:0 8px 30px rgba(0,0,0,0.6);backdrop-filter: blur(6px);text-align:center}
    .text{font-size:clamp(36px,9vw,140px);line-height:0.9;font-weight:800;color:var(--text)}
    .text{position:relative}
    .text::before{content:attr(data-t);position:absolute;inset:0;color:var(--glow);filter:blur(18px);opacity:0.8;z-index:-2;transform:translateY(2px) scale(1.02)}
    .sub{margin-top:18px;color:#bfbfc6;font-size:clamp(12px,2.8vw,16px)}
    .controls{margin-top:22px;display:flex;gap:10px;justify-content:center}
    button{background:transparent;border:1px solid rgba(255,255,255,0.08);padding:8px 12px;border-radius:10px;color:var(--text);cursor:pointer}
    button:hover{transform:translateY(-2px)}
    .muted{opacity:0.6}
    @media (prefers-reduced-motion: no-preference){button{transition:all .18s ease}}
  </style>
</head>
<body>
  <main class="card" role="main">
    <div class="text" data-t="блять долбаёб">блять долбаёб</div>
    <div class="sub muted">Простая демонстрационная страница. Нажмите кнопку, чтобы переключить цензуру.</div>
    <div class="controls">
      <button id="toggle">Цензурировать</button>
      <button id="download">Скачать HTML</button>
    </div>
  </main>

  <script>
    const textEl = document.querySelector('.text')
    const toggle = document.getElementById('toggle')
    const downloadBtn = document.getElementById('download')
    let censored = false
    const raw = textEl.textContent
    const cens = raw.replace(/\S/g, '•')

    toggle.addEventListener('click', ()=>{
      censored = !censored
      textEl.textContent = censored ? cens : raw
      textEl.setAttribute('data-t', textEl.textContent)
      toggle.textContent = censored ? 'Показать оригинал' : 'Цензурировать'
    })

    downloadBtn.addEventListener('click', ()=>{
      const blob = new Blob([document.documentElement.outerHTML], {type: 'text/html;charset=utf-8'})
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = 'index.html'
      document.body.appendChild(a)
      a.click()
      a.remove()
      URL.revokeObjectURL(url)
    })
  </script>
</body>
</html>
