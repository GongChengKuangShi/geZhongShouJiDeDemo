//
//  PlaceholderTextView.m
//  wyh
//
//  Created by Lee on 16/1/5.
//  Copyright © 2016年 HW. All rights reserved.
//

#import "PlaceholderTextView.h"

@implementation PlaceholderTextView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setPageLabelUI];
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder{

    if (_placeholder != placeholder) {
        _placeholder = placeholder;
        [self.placeHolderLabel removeFromSuperview];
        self.placeHolderLabel = nil;
        [self setNeedsDisplay];
    }
    
}

- (UILabel *)setPageLabelUI {
    _pageLabel = [[UILabel alloc] init];
    CGRect frame = _pageLabel.frame;
    frame.size.width = 60;
    frame.size.height = 20;
    frame.origin.x = self.frame.size.width - 10 - frame.size.width;
    frame.origin.y = self.frame.size.height - 30;
    _pageLabel.frame = frame;
    [_pageLabel setTextAlignment:NSTextAlignmentRight];
    _pageLabel.font = [UIFont systemFontOfSize:13];
    _pageLabel.text = @"0/200";
    [self addSubview:_pageLabel];
    return _pageLabel;
}

- (void)textChanged:(NSNotification *)notification{

    if ([[self placeholder] length] == 0) {
        return;
    }
    if ([[self text] length] == 0) {
        [[self viewWithTag:999] setAlpha:1.0];
    }
    else{
        [[self viewWithTag:999] setAlpha:0];
    }
}

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];

    if ([[self placeholder] length] > 0) {
        if (_placeHolderLabel == nil) {
            _placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if ([[self text] length] == 0 && [[self placeholder] length] >0) {
        [[self viewWithTag:999] setAlpha:1.0];
    }
}



@end
