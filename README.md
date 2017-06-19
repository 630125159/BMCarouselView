# BMCarouselView

## Feature
![image](https://github.com/BlueMercury/BMCarouselView/blob/master/demo.gif)

## Installation

Simply copy "BMCarouselView" floder to your project.

## Getting Started
Use by including the following import:

```
#import "BMCarouselView.h"
```
Add BMCarouselView in your view:

```
    BMCarouselView *carouselView = [[BMCarouselView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500)
                                                            pictureArray:picArray
                                                          pictureSpacing:10];
```
Tips:you need to make sure every picture in "picArray" has same aspect ratio(width/height), to make sure we have best display effect.


## Communication

- If you need help, or if you'd like to ask a general question, please contact me. Email:  lizhiqiangcs@outlook.com
- If you found a bug, and can provide steps to reliably reproduce it, please open an issue.
- If you have a feature request, please open an issue.
- If you want to contribute, please submit a pull request.