#ifndef X264_API_H
#define X264_API_H

#ifdef SHARED_X264_BUILD
#ifdef X264_SHARED_EXPORTS
#define LIBX264_API __declspec(dllexport)
#else
#define LIBX264_API __declspec(dllimport)
#endif
#else
#define LIBX264_API
#endif

LIBX264_API int main_impl(int argc, char **argv);

#endif // X264_API_H
