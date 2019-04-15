## Filter
> mask를 통해 이미지에 어떠한 작업을 하는 것

이미지의 noise 제거 혹은 edge detection 등의 목적을 이루기 위하여 이미지에 mask의 값을 행렬의 대응되는 값끼리 곱한 후 합을 계산하여 필터의 중앙 위치의 이미지 index에 값을 넣는 작업을 한다.

### Low pass filter
> 이미지의 Low 한 값을 남기는 필터
 
Low pass filter는 이미지의 경계부분을 뭉개는 효과(blur 효과)를 내고 noise를 제거하는 데에 사용할 수 있다. low pass filter는 기존 이미지의 색상보다 전체적으로 어두워지거나 밝아지게 하지 않기 위하여 필터의 합이 1이 되게 만든다.

#### Average filter
> 평균을 구하고 그 값을 이미지에 넣는 필터

필터의 모든 값이  1/필터크기의 값을 가지고 있어 필터에 대응되는 모든 값을 더하고 그 합을 구하여 필터 중앙 위치의 이미지 값에 그 값을 대입한다. 이를 반복해 실행할 경우 이미지 intensity 값의 차이가 줄어들기 때문에 경계 부분이 뭉개지는 효과가 일어난다. 

#### Weighted Average filter
> 이미지의 중앙에 더 많은 가중치를 둔 필터

이미지에서 주변값의 영향도 크겠지만 실제 위치의 값이 더 영향이 클 것이므로 실제 위치의 값에 대해 더 높은 가중치를 준 필터이다. average filter에 비해 뭉개짐 효과가 덜하다.

### High pass filter
> 이미지의 High한 값을 남기는 필터

이미지의 경계를 찾는 용도로 주로 사용하며 edge를 더 잘 찾기 위해 필터의 합을 0이 되게 만들기도 한다. 하지만 필터의 합이 1이어도 상관 없다.

#### Laplacian filter
> 이미지의 edge 를 찾는 용도로 사용하는 필터

이미지의 edge를 detection 하는 용도로 주로 사용하며 필터 모양이 중앙이 움푹 들어간 모양을 하고 있다. 주변 intensity 값이 필터 중앙 위치의 intensity 값과 큰 차이가 없을 경우 합이 0에 가까운 값이 나오게 되지만 주변 intensity 값이 크게 증가하는 경계부분일경우 주변 값들이 의해 255를 넘는 값을 가지게 되어 edge를 detection한다.

#### Sobel filter
> 이미지 edge를 수직과 수평에 대해 각각 detection 한 이후 더한다.

이미지의 edge를 수직에 대해 detection하고 수평에 대해 detection하여 edge를 구한 후 이 값을 더해 전체적인 edge detection을 하는 방법을 사용한다.

### Median filter
> 이미지 필터에 대응되는 값들의 중앙값을 구해 그 값을 이미지에 넣음

noise같은 값은 주변의 값과 크게 달라지는 값들을 말하는데 average filter를 사용할 경우 noise의 값에 영향을 상당히 받는 편이다. 하지만 median filter를 사용할 경우 중앙값은 noise에 쉽게 영향을 받지 않기 때문에 noise 제거용으로 사용하기 좋다.

### Unsharp mask
> low한 값을 기존 이미지에서 일정 비율 제거하여 경사가 있는 부분을 더 살림

Image를 Low한 부분과 High한 부분이 있다고 할 때 `Image = Low+High`이다. 이 때 low한 부분은 이미지를 blur하는 효과가 있고 high한 부분은 이미지의 경계를 표현하는 효과를 내기 때문에 Low한 부분을 일정량 k 비율만큼 제거하여 Image에서 경계부분을 부각시키는 필터이다.


### Padding
> 기존 이미지에서 벗어나는 가장자리 값을 참조할 때에 그 값을 대신해주기 위한 값을 씌우는 것

실제 이미지에서 filter 혹은 resize, rotate등의 작업을 할 때에 실제 이미지의 값을 벗어나는 값을 구하려고 한다면 값을 참조할 수가 없다. 이 문제를 막기 위해 실제 값의 가장자리 부분을 padding값으로 채워 문제를 발생하지 않게 만든다.
이 때 zero padding, repetition padding, mirror padding의 방법이 사용된다.

#### Zero padding
> 단순히 0으로 채움

matlab의 zeros 를 통해 공간을 만든 후 이미지를 중앙에 두어 기존에 설정해둔 zeros의 값이 padding이 되게 만드는 방법이다. 위에서 있었던 벗어나는 값을 참조하는 경우는 일어나지 않지만 가장자리 부분이 검은색으로 보이게 될 수 있다.

#### Repetition padding
> 가장자리 부분의 값을 반복하는 padding

가장자리 부분의 값을 단순 반복시키는 방법이다. zero padding에 있었던 가장자리 부분이 검은색으로 보이는 현상이 사라진다.

#### Mirror padding
> 이미지 경계에서부터 거울처럼 반사된 것처럼 보이는 padding

가장자리부터 padding size만큼 기존 이미지와 대응되게 값을 복사하는 방법이다. 

