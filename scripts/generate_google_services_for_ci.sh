#!/bin/bash
# Generate a dummy google-services.json file for CI builds

GOOGLE_SERVICES_JSON="android/app/google-services.json"

cat > "$GOOGLE_SERVICES_JSON" << 'EOF'
{
  "project_info": {
    "project_number": "000000000000",
    "firebase_url": "https://ci-dummy-project.firebaseio.com",
    "project_id": "ci-dummy-project",
    "storage_bucket": "ci-dummy-project.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:000000000000:android:0000000000000000",
        "android_client_info": {
          "package_name": "com.aimate.econa_mobile_app"
        }
      },
      "oauth_client": [],
      "api_key": [
        {
          "current_key": "CI_DUMMY_API_KEY"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": []
        }
      }
    }
  ],
  "configuration_version": "1"
}
EOF

echo "Generated $GOOGLE_SERVICES_JSON for CI builds"

