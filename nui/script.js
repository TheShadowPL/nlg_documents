var departments = document.getElementsByClassName('department');
var cards = document.getElementsByClassName('card');
var bottomValues = ['0px', '50px', '100px'];
var isHidingUI = false; 

var oldBottom = 0;
var newBottom = 0;

//$("body").show()
//$("body").none()

for (var i = 0; i < cards.length; i++) {
  cards[i].addEventListener('click', function() {
    animation(this.id);
  })
}

window.addEventListener('message', function(event) {
  if (event.data.action === 'modifyBodyClass') {
    var body = document.getElementsByTagName('body')[0];
    body.style.display = event.data.className;
  }
});

document.addEventListener('keyup', function(event) {
  if (event.key === 'Escape' && !isHidingUI) {
    isHidingUI = true; // jebane chujstwo dwa razy sie wywolywalo
    $.post(`https://${GetParentResourceName()}/closewallet`, function(response) {
      isHidingUI = false; 
    });
  }
});


function animation(id) {
  for (var i = 0; i < cards.length; i++) {
    var card = document.getElementById(cards[i].id);
    card.style.bottom = bottomValues[i];
    if (card.id != id) {
      card.name = '';
    }
  }

  var selected = document.getElementById(id);
  console.log(id);
  selected.style.transition = '0.3s';

  if (selected.name != 'moved') {
    oldBottom = parseInt(selected.style.bottom, 10);
    newBottom = '350px';
    console.log('karta wyjeta');
    selected.style.bottom = newBottom;
    selected.name = 'moved';

    // Modyfikacja zawartości po wybraniu karty
    var h1Element = selected.querySelector('h1');
    h1Element.textContent = 'Luke Hill';

  } else if (selected.name == 'moved') {
    selected.style.bottom = oldBottom + 'px';
    selected.name = '';
  }
}

