if(NOT TARGET OpenCV)
    # Define ${OpenCV_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(OpenCV_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${OpenCV_PROJECT_ROOT}/../.." ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            "${OpenCV_PROJECT_ROOT}/include/CinderOpenCV.h"
            )

    # Create the library!
    add_library(OpenCV ${SOURCE_LIST})

    # Add include directories.
    # Notice that `cinderblock.xml` has `<includePath>src</includePath>`.
    # So you need to set `../../src/` to include.
    target_include_directories(OpenCV PUBLIC "${OpenCV_PROJECT_ROOT}/include/opencv2" )
    target_include_directories(OpenCV SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )


    # If your Cinder block has no source code but instead pre-build libraries,
    # you can specify all of them here (uncomment the below line and adjust to your needs).
    # Make sure to use the libraries for the right platform.
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_calib3d249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_contrib249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_core249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_features2d249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_flann249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_gpu249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_imgproc249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_legacy249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_ml249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_nonfree249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_objdetect249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_ocl249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_photo249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_stitching249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_superres249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_ts249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_video249d.lib")
    target_link_libraries(OpenCV "${Cinder-OpenCV_PROJECT_ROOT}/lib/vc2013/x86/opencv_videostab249d.lib")





    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(OpenCV PRIVATE cinder)

endif()