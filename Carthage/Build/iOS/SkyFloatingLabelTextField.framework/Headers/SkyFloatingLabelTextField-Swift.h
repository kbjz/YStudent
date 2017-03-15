// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIColor;
@class UIFont;
@class UIView;
@class UILabel;
@class NSCoder;

/**
  A beautiful and flexible textfield implementation with support for title label, error message and placeholder.
*/
SWIFT_CLASS("_TtC25SkyFloatingLabelTextField25SkyFloatingLabelTextField")
@interface SkyFloatingLabelTextField : UITextField
/**
  The value of the title appearing duration
*/
@property (nonatomic) NSTimeInterval titleFadeInDuration;
/**
  The value of the title disappearing duration
*/
@property (nonatomic) NSTimeInterval titleFadeOutDuration;
/**
  A UIColor value that determines the text color of the editable text
*/
@property (nonatomic, strong) UIColor * _Nullable textColor;
/**
  A UIColor value that determines text color of the placeholder label
*/
@property (nonatomic, strong) UIColor * _Nonnull placeholderColor;
/**
  A UIColor value that determines text color of the placeholder label
*/
@property (nonatomic, strong) UIFont * _Nullable placeholderFont;
/**
  A UIColor value that determines the text color of the title label when in the normal state
*/
@property (nonatomic, strong) UIColor * _Nonnull titleColor;
/**
  A UIColor value that determines the color of the bottom line when in the normal state
*/
@property (nonatomic, strong) UIColor * _Nonnull lineColor;
/**
  A UIColor value that determines the color used for the title label and the line when the error message is not \code
  nil
  \endcode
*/
@property (nonatomic, strong) UIColor * _Nonnull errorColor;
/**
  A UIColor value that determines the text color of the title label when editing
*/
@property (nonatomic, strong) UIColor * _Nonnull selectedTitleColor;
/**
  A UIColor value that determines the color of the line in a selected state
*/
@property (nonatomic, strong) UIColor * _Nonnull selectedLineColor;
/**
  A CGFloat value that determines the height for the bottom line when the control is in the normal state
*/
@property (nonatomic) CGFloat lineHeight;
/**
  A CGFloat value that determines the height for the bottom line when the control is in a selected state
*/
@property (nonatomic) CGFloat selectedLineHeight;
/**
  The internal \code
  UIView
  \endcode to display the line below the text input.
*/
@property (nonatomic, strong) UIView * _Null_unspecified lineView;
/**
  The internal \code
  UILabel
  \endcode that displays the selected, deselected title or the error message based on the current state.
*/
@property (nonatomic, strong) UILabel * _Null_unspecified titleLabel;
/**
  The formatter to use before displaying content in the title label. This can be the \code
  title
  \endcode, \code
  selectedTitle
  \endcode or the \code
  errorMessage
  \endcode.
  The default implementation converts the text to uppercase.
*/
@property (nonatomic, copy) NSString * _Nonnull (^ _Nonnull titleFormatter)(NSString * _Nonnull);
/**
  Identifies whether the text object should hide the text being entered.
*/
@property (nonatomic, setter=setSecureTextEntry:) BOOL isSecureTextEntry;
/**
  A String value for the error message to display.
*/
@property (nonatomic, copy) NSString * _Nullable errorMessage;
/**
  A Boolean value that determines whether the receiver is highlighted. When changing this value, highlighting will be done with animation
*/
@property (nonatomic, setter=setHighlighted:) BOOL isHighlighted;
/**
  A Boolean value that determines whether the textfield is being edited or is selected.
*/
@property (nonatomic, readonly) BOOL editingOrSelected;
/**
  A Boolean value that determines whether the receiver has an error message.
*/
@property (nonatomic, readonly) BOOL hasErrorMessage;
/**
  The text content of the textfield
*/
@property (nonatomic, copy) NSString * _Nullable text;
/**
  The String to display when the input field is empty.
  The placeholder can also appear in the title label when both \code
  title
  \endcode \code
  selectedTitle
  \endcode and are \code
  nil
  \endcode.
*/
@property (nonatomic, copy) NSString * _Nullable placeholder;
/**
  The String to display when the textfield is editing and the input is not empty.
*/
@property (nonatomic, copy) NSString * _Nullable selectedTitle;
/**
  The String to display when the textfield is not editing and the input is not empty.
*/
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, setter=setSelected:) BOOL isSelected;
/**
  Initializes the control
  \param frame the frame of the control 

*/
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
/**
  Intialzies the control by deserializing it
  \param coder the object to deserialize the control from 

*/
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/**
  Invoked when the editing state of the textfield changes. Override to respond to this change.
*/
- (void)editingChanged;
/**
  Attempt the control to become the first responder

  returns:
  True when successfull becoming the first responder
*/
- (BOOL)becomeFirstResponder;
/**
  Attempt the control to resign being the first responder

  returns:
  True when successfull resigning being the first responder
*/
- (BOOL)resignFirstResponder;
/**
  Update the colors for the control. Override to customize colors.
*/
- (void)updateColors;
- (void)setTitleVisible:(BOOL)titleVisible animated:(BOOL)animated animationCompletion:(void (^ _Nullable)(void))animationCompletion;
/**
  Returns whether the title is being displayed on the control.

  returns:
  True if the title is displayed on the control, false otherwise.
*/
- (BOOL)isTitleVisible;
/**
  Calculate the rectangle for the textfield when it is not being edited
  \param bounds The current bounds of the field


  returns:
  The rectangle that the textfield should render in
*/
- (CGRect)textRectForBounds:(CGRect)bounds;
/**
  Calculate the rectangle for the textfield when it is being edited
  \param bounds The current bounds of the field


  returns:
  The rectangle that the textfield should render in
*/
- (CGRect)editingRectForBounds:(CGRect)bounds;
/**
  Calculate the rectangle for the placeholder
  \param bounds The current bounds of the placeholder


  returns:
  The rectangle that the placeholder should render in
*/
- (CGRect)placeholderRectForBounds:(CGRect)bounds;
/**
  Calculate the bounds for the title label. Override to create a custom size title field.
  \param bounds The current bounds of the title

  \param editing True if the control is selected or highlighted


  returns:
  The rectangle that the title label should render in
*/
- (CGRect)titleLabelRectForBounds:(CGRect)bounds editing:(BOOL)editing;
/**
  Calculate the bounds for the bottom line of the control. Override to create a custom size bottom line in the textbox.
  \param bounds The current bounds of the line

  \param editing True if the control is selected or highlighted


  returns:
  The rectangle that the line bar should render in
*/
- (CGRect)lineViewRectForBounds:(CGRect)bounds editing:(BOOL)editing;
/**
  Calculate the height of the title label.
  -returns: the calculated height of the title label. Override to size the title with a different height
*/
- (CGFloat)titleHeight;
/**
  Calcualte the height of the textfield.
  -returns: the calculated height of the textfield. Override to size the textfield with a different height
*/
- (CGFloat)textHeight;
/**
  Invoked when the interface builder renders the control
*/
- (void)prepareForInterfaceBuilder;
/**
  Invoked by layoutIfNeeded automatically
*/
- (void)layoutSubviews;
/**
  Calculate the content size for auto layout

  returns:
  the content size to be used for auto layout
*/
@property (nonatomic, readonly) CGSize intrinsicContentSize;
@end


/**
  A beautiful and flexible textfield implementation with support for icon, title label, error message and placeholder.
*/
SWIFT_CLASS("_TtC25SkyFloatingLabelTextField33SkyFloatingLabelTextFieldWithIcon")
@interface SkyFloatingLabelTextFieldWithIcon : SkyFloatingLabelTextField
/**
  A UILabel value that identifies the label used to display the icon
*/
@property (nonatomic, strong) UILabel * _Null_unspecified iconLabel;
/**
  A UIFont value that determines the font that the icon is using
*/
@property (nonatomic, strong) UIFont * _Nullable iconFont;
/**
  A String value that determines the text used when displaying the icon
*/
@property (nonatomic, copy) NSString * _Nullable iconText;
/**
  A UIColor value that determines the color of the icon in the normal state
*/
@property (nonatomic, strong) UIColor * _Nonnull iconColor;
/**
  A UIColor value that determines the color of the icon when the control is selected
*/
@property (nonatomic, strong) UIColor * _Nonnull selectedIconColor;
/**
  A float value that determines the width of the icon
*/
@property (nonatomic) CGFloat iconWidth;
/**
  A float value that determines the left margin of the icon. Use this value to position the icon more precisely horizontally.
*/
@property (nonatomic) CGFloat iconMarginLeft;
/**
  A float value that determines the bottom margin of the icon. Use this value to position the icon more precisely vertically.
*/
@property (nonatomic) CGFloat iconMarginBottom;
/**
  A float value that determines the rotation in degrees of the icon. Use this value to rotate the icon in either direction.
*/
@property (nonatomic) double iconRotationDegrees;
/**
  Initializes the control
  \param frame the frame of the control 

*/
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
/**
  Intialzies the control by deserializing it
  \param coder the object to deserialize the control from 

*/
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/**
  Update the colors for the control. Override to customize colors.
*/
- (void)updateColors;
/**
  Calculate the bounds for the textfield component of the control. Override to create a custom size textbox in the control.
  \param bounds The current bounds of the textfield component


  returns:
  The rectangle that the textfield component should render in
*/
- (CGRect)textRectForBounds:(CGRect)bounds;
/**
  Calculate the rectangle for the textfield when it is being edited
  \param bounds The current bounds of the field


  returns:
  The rectangle that the textfield should render in
*/
- (CGRect)editingRectForBounds:(CGRect)bounds;
/**
  Calculates the bounds for the placeholder component of the control. Override to create a custom size textbox in the control.
  \param bounds The current bounds of the placeholder component


  returns:
  The rectangle that the placeholder component should render in
*/
- (CGRect)placeholderRectForBounds:(CGRect)bounds;
/**
  Invoked by layoutIfNeeded automatically
*/
- (void)layoutSubviews;
@end


@interface UITextField (SWIFT_EXTENSION(SkyFloatingLabelTextField))
@end

#pragma clang diagnostic pop
