## rgb2gray
> RGB Image에서 GrayScale Image로 변환하는 함수를 지원  

RGB 이미지의 색상은 R, G, B 에 민감하게 반응하는 정도가 다르므로 
이를 가중치를 다르게 두어 GrayScale Image로 변환함

##### 초록색이 가장 민감하게 반응하고 파란색이 가장 둔감하게 반응함

|  **색상**  |  **가중치**   |
|  -------   |  ----------  |
|    Red     |    0.2989    |
|   Green    |    0.5870    |
|    Blue    |    0.1140    |

### rgb2gray_test
> RGB 이미지를 읽어 GrayScale 이미지로 변환한 후 imshow 함수를 통해 이미지를 보여줌

