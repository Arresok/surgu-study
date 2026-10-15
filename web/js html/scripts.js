const elements = [
    {width: 50, heidht: 40 },
    {width: 100, heidht: 60 },
    {width: 80, heidht: 100 },
    {width: 120, heidht: 70 },
    {width: 60, heidht: 90 }
];

const root = document.getElementById('root');

elements.forEach(function (item) {
    const element = document.createElement('div');
    element.classList.add('item');

    element.style.width = item.width + 'px';
    element.style.height = item.heidht + 'px';

    root.appendChild(element);

    
});