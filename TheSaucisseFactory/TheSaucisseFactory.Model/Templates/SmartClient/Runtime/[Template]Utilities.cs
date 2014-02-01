﻿[%@ namespace name="System" %]

using System;
using System.Globalization;
using System.IO;
using System.Net.Cache;   
using System.Windows;
using System.Windows.Media;
using System.Windows.Data;
using System.Windows.Media.Imaging;
using CodeFluent.Runtime.BinaryServices;    
    
namespace CodeFluent.Runtime.SmartClient
{
    public class EnumerationIntConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (!(value is Enum))
                return null;

            Enum me = (Enum)value;
            return me.GetHashCode();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return Enum.ToObject(targetType, value);
        }
    }

    public class BinaryImageConverter : IValueConverter
    {
        object IValueConverter.Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value != null && value is ServiceBinaryLargeObject)
            {
                ServiceBinaryLargeObject blob = (ServiceBinaryLargeObject)value;
                BitmapImage image = new BitmapImage();
                image.BeginInit();
                image.CacheOption = BitmapCacheOption.OnLoad;
                image.CreateOptions = BitmapCreateOptions.IgnoreImageCache;
                image.UriSource = new Uri(blob.ServerUrl);
                image.EndInit();
                return image;
            }
            return null;
        }

        object IValueConverter.ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}