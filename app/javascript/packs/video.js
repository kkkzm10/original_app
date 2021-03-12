  //Peer作成
  const peer = new Peer({
    key: 'e1d3f48b-663c-46c9-8918-478d100b03e5',
    debug: 3
  });

  //PeerID取得
peer.on('open', () => {
  document.getElementById('my-id').textContent = peer.id;
});

// 発信処理
document.getElementById('make-call').onclick = () => {
  const theirID = document.getElementById('their-id').value;
  const mediaConnection = peer.call(theirID, localStream);
  setEventListener(mediaConnection);
};

// イベントリスナを設置する関数
const setEventListener = mediaConnection => {
  mediaConnection.on('stream', stream => {
    // video要素にカメラ映像をセットして再生
    const videoElm = document.getElementById('their-video')
    videoElm.srcObject = stream;
    videoElm.play();
  });
}

//着信処理
peer.on('call', mediaConnection => {
  mediaConnection.answer(localStream);
  setEventListener(mediaConnection);
});

//通信切断
peer.on('close', () => {
  alert('通信が切断しました。');
});